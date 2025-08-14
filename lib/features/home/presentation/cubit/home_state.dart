part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String nearestStation;
  final double lat;
  final double lng;

  const HomeLoaded({required this.nearestStation, required this.lat, required this.lng});

  @override
  List<Object> get props => [nearestStation, lat, lng];
}

class HomePlaceFound extends HomeState {
  final String nearestStation;
  final double lat;
  final double lng;

  const HomePlaceFound({required this.nearestStation, required this.lat, required this.lng});

  @override
  List<Object> get props => [nearestStation, lat, lng];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}