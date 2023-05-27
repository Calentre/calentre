import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/themes.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Calentre',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme(),
      // theme: AppTheme.darkTheme(),
      routerConfig: routerConfig,
    );
  }
}
