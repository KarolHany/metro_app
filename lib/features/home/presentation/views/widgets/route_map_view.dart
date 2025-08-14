import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metro_app/core/services/location_service.dart';
import 'package:url_launcher/url_launcher.dart';

class RouteMapView extends StatefulWidget {
  final String stationName;

  const RouteMapView({super.key, required this.stationName});

  @override
  State<RouteMapView> createState() => _RouteMapViewState();
}

class _RouteMapViewState extends State<RouteMapView> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  Station? _selectedStation;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      // Get current position
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get selected station
      _selectedStation = LocationService.getStationByName(widget.stationName);

      if (_currentPosition != null && _selectedStation != null) {
        _setupMarkersAndRoute();
      }
    } catch (e) {
      print('Error initializing map: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _setupMarkersAndRoute() {
    if (_currentPosition == null || _selectedStation == null) return;

    // Create markers
    _markers = {
      Marker(
        markerId: const MarkerId('current_location'),
        position: LatLng(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
        ),
        infoWindow: const InfoWindow(title: 'Your Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId(widget.stationName),
        position: LatLng(
          _selectedStation!.latitude,
          _selectedStation!.longitude,
        ),
        infoWindow: InfoWindow(title: widget.stationName),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    };

    // Create polyline for route (straight line for now)
    _polylines = {
      Polyline(
        polylineId: const PolylineId('route'),
        points: [
          LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          LatLng(_selectedStation!.latitude, _selectedStation!.longitude),
        ],
        color: Colors.blue,
        width: 3,
      ),
    };

    setState(() {});
  }

  void _openInGoogleMaps() async {
    if (_currentPosition == null || _selectedStation == null) return;

    final url =
        'https://www.google.com/maps/dir/${_currentPosition!.latitude},${_currentPosition!.longitude}/${_selectedStation!.latitude},${_selectedStation!.longitude}/';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Google Maps')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_currentPosition == null || _selectedStation == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Route Map')),
        body: const Center(
          child: Text('Could not load location or station data'),
        ),
      );
    }

    // Calculate center position between current location and station
    final centerLat =
        (_currentPosition!.latitude + _selectedStation!.latitude) / 2;
    final centerLng =
        (_currentPosition!.longitude + _selectedStation!.longitude) / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Route to ${widget.stationName}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: _openInGoogleMaps,
            tooltip: 'Open in Google Maps',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(centerLat, centerLng),
                zoom: 12,
              ),
              markers: _markers,
              polylines: _polylines,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              mapToolbarEnabled: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Distance: ${_calculateDistance().toStringAsFixed(1)} km',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _openInGoogleMaps,
                      icon: const Icon(Icons.directions),
                      label: const Text('Get Directions'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'From: Your Current Location',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  'To: ${widget.stationName}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _calculateDistance() {
    if (_currentPosition == null || _selectedStation == null) return 0.0;

    return _selectedStation!.distanceTo(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
    );
  }
}

