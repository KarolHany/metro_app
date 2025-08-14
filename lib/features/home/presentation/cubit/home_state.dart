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

  const HomeLoaded({required this.nearestStation});

  @override
  List<Object> get props => [nearestStation];
}

class HomePlaceFound extends HomeState {
  final String nearestStation;

  const HomePlaceFound({required this.nearestStation});

  @override
  List<Object> get props => [nearestStation];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}