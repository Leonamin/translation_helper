import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation_helper/2_res/app_theme/color_hue.dart';
import 'package:translation_helper/2_res/route/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '번역 도우미',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorHue.primary1),
        useMaterial3: true,
      ),
      routerConfig: viewRouter,
    );
  }
}
