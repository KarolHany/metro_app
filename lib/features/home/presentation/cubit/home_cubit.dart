// features/home/cubit/home_cubit.dart
import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metro_app/features/home/data/models/station_lat_long.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final List<Station> stations = [
    Station(name: 'Helwan', lat: 29.8419, lng: 31.3000),
    Station(name: 'Ain Helwan', lat: 29.8500, lng: 31.3100),
    Station(name: 'Helwan University', lat: 29.8600, lng: 31.3200),
    Station(name: 'Wadi Hof', lat: 29.8700, lng: 31.3300),
    Station(name: 'Hadayek Helwan', lat: 29.8800, lng: 31.3400),
    Station(name: 'El-Maasara', lat: 29.8900, lng: 31.3500),
    Station(name: 'Tora El-Asmant', lat: 29.9000, lng: 31.3600),
    Station(name: 'Kozzika', lat: 29.9100, lng: 31.3700),
    Station(name: 'Tora El-Balad', lat: 29.9200, lng: 31.3800),
    Station(name: 'Sakanat El-Maadi', lat: 29.9300, lng: 31.3900),
    Station(name: 'Maadi', lat: 29.9400, lng: 31.4000),
    Station(name: 'Hadayek El-Maadi', lat: 29.9500, lng: 31.4100),
    Station(name: 'Dar El-Salam', lat: 29.9600, lng: 31.4200),
    Station(name: 'El-Zahraa', lat: 29.9700, lng: 31.4300),
    Station(name: 'Mar Girgis', lat: 29.9800, lng: 31.4400),
    Station(name: 'El-Malek El-Saleh', lat: 29.9900, lng: 31.4500),
    Station(name: 'Al-Sayeda Zeinab', lat: 30.0000, lng: 31.4600),
    Station(name: 'Saad Zaghloul', lat: 30.0100, lng: 31.4700),
    Station(name: 'Sadat', lat: 30.0200, lng: 31.4800),
    Station(name: 'Nasser', lat: 30.0300, lng: 31.4900),
    Station(name: 'Orabi', lat: 30.0400, lng: 31.5000),
    Station(name: 'Al-Shohadaa', lat: 30.0500, lng: 31.5100),
    Station(name: 'Ghamra', lat: 30.0600, lng: 31.5200),
    Station(name: 'El-Demerdash', lat: 30.0700, lng: 31.5300),
    Station(name: 'Manshiet El-Sadr', lat: 30.0800, lng: 31.5400),
    Station(name: 'Kobri El-Qobba', lat: 30.0900, lng: 31.5500),
    Station(name: 'Hammamat El-Qobba', lat: 30.1000, lng: 31.5600),
    Station(name: 'Saray El-Qobba', lat: 30.1100, lng: 31.5700),
    Station(name: 'Hadayeq El-Zaitoun', lat: 30.1200, lng: 31.5800),
    Station(name: 'Helmeyet El-Zaitoun', lat: 30.1300, lng: 31.5900),
    Station(name: 'El-Matareyya', lat: 30.1400, lng: 31.6000),
    Station(name: 'Ain Shams', lat: 30.1500, lng: 31.6100),
    Station(name: 'Ezbet El-Nakhl', lat: 30.1600, lng: 31.6200),
    Station(name: 'El-Marg', lat: 30.1700, lng: 31.6300),
    Station(name: 'New El-Marg', lat: 30.1800, lng: 31.6400),
    Station(name: 'El-Mounib', lat: 30.1900, lng: 31.6500),
    Station(name: 'Sakiat Mekki', lat: 30.2000, lng: 31.6600),
    Station(name: 'Omm El-Misryeen', lat: 30.2100, lng: 31.6700),
    Station(name: 'Giza', lat: 30.2200, lng: 31.6800),
    Station(name: 'Faisal', lat: 30.2300, lng: 31.6900),
    Station(name: 'Cairo University', lat: 30.2400, lng: 31.7000),
    Station(name: 'Bohooth', lat: 30.2500, lng: 31.7100),
    Station(name: 'Dokki', lat: 30.2600, lng: 31.7200),
    Station(name: 'Opera', lat: 30.2700, lng: 31.7300),
    Station(name: 'Mohamed Naguib', lat: 30.2800, lng: 31.7400),
    Station(name: 'Ataba', lat: 30.2900, lng: 31.7500),
    Station(name: 'Massara', lat: 30.3000, lng: 31.7600),
    Station(name: 'Rod El-Farag', lat: 30.3100, lng: 31.7700),
    Station(name: 'St. Teresa', lat: 30.3200, lng: 31.7800),
    Station(name: 'El-Khalafawy', lat: 30.3300, lng: 31.7900),
    Station(name: 'El-Mezallat', lat: 30.3400, lng: 31.8000),
    Station(name: 'Kolleyyet El-Zeraa', lat: 30.3500, lng: 31.8100),
    Station(name: 'Shubra El-Kheima', lat: 30.3600, lng: 31.8200),
    Station(name: 'Al-Ahram', lat: 30.3700, lng: 31.8300),
    Station(name: 'Koleyet El-Banat', lat: 30.3800, lng: 31.8400),
    Station(name: 'Cairo Stadium', lat: 30.3900, lng: 31.8500),
    Station(name: 'Cairo Fair', lat: 30.4000, lng: 31.8600),
    Station(name: 'Abbassiya', lat: 30.4100, lng: 31.8700),
    Station(name: 'Abdou Pasha', lat: 30.4200, lng: 31.8800),
    Station(name: 'El-Geish', lat: 30.4300, lng: 31.8900),
    Station(name: 'Bab El-Shaaria', lat: 30.4400, lng: 31.9000),
    Station(name: 'Maspero', lat: 30.4500, lng: 31.9100),
    Station(name: 'Safaa Hijazy', lat: 30.4600, lng: 31.9200),
    Station(name: 'Kit-Kat', lat: 30.4700, lng: 31.9300),
    Station(name: 'Sudan', lat: 30.4800, lng: 31.9400),
    Station(name: 'Imbaba', lat: 30.4900, lng: 31.9500),
    Station(name: 'El-Bohy', lat: 30.5000, lng: 31.9600),
    Station(name: 'El-Qawmia', lat: 30.5100, lng: 31.9700),
    Station(name: 'Ring Road', lat: 30.5200, lng: 31.9800),
    Station(name: 'Rod El Farag Corridor', lat: 30.5300, lng: 31.9900),
    Station(name: 'Tawfikia', lat: 30.5400, lng: 32.0000),
    Station(name: 'Wadi El Nile', lat: 30.5500, lng: 32.0100),
    Station(name: 'Gamet El Dowel', lat: 30.5600, lng: 32.0200),
    Station(name: 'Boulak El Dakrour', lat: 30.5700, lng: 32.0300),
    Station(name: 'Haykestep', lat: 30.5800, lng: 32.0400),
    Station(name: 'Omar Ibn El Khattab', lat: 30.5900, lng: 32.0500),
    Station(name: 'Qubaa', lat: 30.6000, lng: 32.0600),
    Station(name: 'Hesham Barakat', lat: 30.6100, lng: 32.0700),
    Station(name: 'El Nozha', lat: 30.6200, lng: 32.0800),
    Station(name: 'Nadi El Shams', lat: 30.6300, lng: 32.0900),
    Station(name: 'Alf Maskan', lat: 30.6400, lng: 32.1000),
    Station(name: 'Heliopolis', lat: 30.6500, lng: 32.1100),
    Station(name: 'Haroun', lat: 30.6600, lng: 32.1200),
  ];

  Future<void> getNearestStation() async {
    emit(HomeLoading());
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(HomeError('Location services are disabled.'));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(HomeError('Location permissions are denied'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(HomeError('Location permissions are permanently denied'));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      Station nearest = _findNearestStation(position);
      emit(HomeLoaded(nearestStation: nearest.name, lat: nearest.lat, lng: nearest.lng));
    } catch (e) {
      emit(HomeError('Could not get location: ${e.toString()}'));
    }
  }

  Station _findNearestStation(Position position) {
    Station nearest = stations.first;
    double minDistance = double.maxFinite;

    for (var station in stations) {
      final distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        station.lat,
        station.lng,
      );

      if (distance < minDistance) {
        minDistance = distance;
        nearest = station;
      }
    }
    return nearest;
  }

  Future<void> findNearestStationFromPlace(String position) async {
    emit(HomeLoading());
    try {
      double queryLat;
      double queryLng;

      try {
        final List<Location> locations = await locationFromAddress('$position, Egypt');
        if (locations.isEmpty) {
          throw Exception('No results from geocoding');
        }
        queryLat = locations.first.latitude;
        queryLng = locations.first.longitude;
      } catch (_) {
        final coords = await _geocodeWithNominatim('$position, Egypt');
        queryLat = coords.$1;
        queryLng = coords.$2;
      }

      final Station nearest = _findNearestStationToPoint(queryLat, queryLng);
      emit(HomePlaceFound(nearestStation: nearest.name, lat: nearest.lat, lng: nearest.lng));
    } catch (e) {
      emit(HomeError('Could not find nearest station for "$position": ${e.toString()}'));
    }
  }

  Station _findNearestStationToPoint(double latitude, double longitude) {
    Station nearest = stations.first;
    double minDistance = double.maxFinite;
    for (final station in stations) {
      final double distance = Geolocator.distanceBetween(
        latitude,
        longitude,
        station.lat,
        station.lng,
      );
      if (distance < minDistance) {
        minDistance = distance;
        nearest = station;
      }
    }
    return nearest;
  }

  Future<(double, double)> _geocodeWithNominatim(String query) async {
    final uri = Uri.parse('https://nominatim.openstreetmap.org/search?q=${Uri.encodeQueryComponent(query)}&format=json&limit=1');
    final response = await http.get(
      uri,
      headers: {
        'User-Agent': 'metro_app/1.0 (https://example.com)'
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Geocoding request failed (${response.statusCode})');
    }
    final List<dynamic> data = json.decode(response.body) as List<dynamic>;
    if (data.isEmpty) {
      throw Exception('No results from geocoding service');
    }
    final Map<String, dynamic> first = data.first as Map<String, dynamic>;
    final double lat = double.parse(first['lat'] as String);
    final double lon = double.parse(first['lon'] as String);
    return (lat, lon);
  }

  
}
