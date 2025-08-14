import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/core/constants/app_constants.dart';
import 'package:metro_app/features/home/cubit/home_cubit.dart';
import 'package:metro_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const Scaffold(backgroundColor: beigeColor, body: HomeViewBody()),
    );
  }
}
