import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/core/services/location_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  String fromStation = '';
  String toStation = '';
  String nearestStation = '';

  void updateFromStation(String station) {
    fromStation = station;
    emit(
      HomeStationUpdated(
        fromStation: fromStation,
        toStation: toStation,
        nearestStation: nearestStation,
      ),
    );
  }

  void updateToStation(String station) {
    toStation = station;
    emit(
      HomeStationUpdated(
        fromStation: fromStation,
        toStation: toStation,
        nearestStation: nearestStation,
      ),
    );
  }

  Future<void> findNearestStation() async {
    emit(HomeLoading());

    try {
      final station = await LocationService.findNearestStation();
      if (station != null) {
        fromStation = station;
        nearestStation = station;
        emit(
          HomeNearestStationFound(
            fromStation: fromStation,
            toStation: toStation,
            nearestStation: nearestStation,
          ),
        );
      } else {
        emit(
          HomeError(
            'Could not find nearest station. Please check location permissions.',
          ),
        );
      }
    } catch (e) {
      emit(HomeError('Error: $e'));
    }
  }

  bool get canSubmit => fromStation.isNotEmpty && toStation.isNotEmpty;
}

