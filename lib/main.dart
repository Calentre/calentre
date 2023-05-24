import 'package:calentre/app/auth/presentation/social_sign_in.dart';
import 'package:calentre/config/theme/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      // darkTheme: AppTheme.darkTheme(),
      theme: AppTheme.darkTheme(),
      home: const SocialSignIn(),
    );
  }
}
