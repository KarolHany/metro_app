import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_app/features/home/presentation/cubit/info_cubit.dart';
import 'package:metro_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable in release builds
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => InfoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
