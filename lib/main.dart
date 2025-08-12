import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:metro_app/features/home/presentation/views/home_view.dart';
import 'package:metro_app/features/info/presentation/views/info_view.dart';
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
