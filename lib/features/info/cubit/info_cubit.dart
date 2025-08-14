import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/features/home/data/models/pair.dart';
import 'package:metro_app/features/home/data/models/stations.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoLoading());

  final StationSrcDest station = StationSrcDest(src: '', dest: '');

  getPathOfTrip(String src, String dest) {
    emit(InfoLoading());
    try {
      final route = station.travel(src, dest);
      final description = station.discribe();
      emit(InfoSuccess(route: route, description: description));
    } catch (e) {
      emit(InfoError(errorMessage: e.toString()));
    }
  }
}
