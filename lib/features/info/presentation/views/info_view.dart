import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/features/info/cubit/info_cubit.dart';
import 'package:metro_app/features/info/presentation/views/widgets/info_view_body.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beigeColor,
      body: BlocBuilder<InfoCubit, InfoState>(
        builder: (context, state) {
          if (state is InfoSuccess) {
            return InfoViewBody(pathOfTrip: state.route , description: state.description!,countOfStations: state.route!.length,);
          } else if (state is InfoError) {
            return Center(child: Text(state.errorMessage!));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
