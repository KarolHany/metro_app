part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeStationUpdated extends HomeState {
  final String fromStation;
  final String toStation;
  final String nearestStation;

  HomeStationUpdated({
    required this.fromStation,
    required this.toStation,
    required this.nearestStation,
  });
}

class HomeNearestStationFound extends HomeState {
  final String fromStation;
  final String toStation;
  final String nearestStation;

  HomeNearestStationFound({
    required this.fromStation,
    required this.toStation,
    required this.nearestStation,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

