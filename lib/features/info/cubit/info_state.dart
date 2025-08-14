part of 'info_cubit.dart';

class InfoState {
  final List<Pair<String, String>>? route;
  final String? description;
  final String? errorMessage;
  InfoState({this.route, this.errorMessage, this.description});
}

class InfoLoading extends InfoState {}

class InfoSuccess extends InfoState {
  InfoSuccess({
    required List<Pair<String, String>> route,
    required String description,
  }) : super(route: route, description: description);
}

class InfoError extends InfoState {
  InfoError({required String errorMessage}) : super(errorMessage: errorMessage);
}
