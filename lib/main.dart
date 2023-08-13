import 'package:calentre/config/constants/constants.dart';
import 'package:calentre/features/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/config/firebase_options.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/themes.dart';
import 'package:calentre/injection_container.dart';
import 'package:calentre/secrets.dart';
import 'package:feature_notifier/feature_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions());
  await Supabase.initialize(
    url: RemoteURLs().supabaseUrl,
    anonKey: Secrets.supabseSecret,
  );
  await FeatureNotifier.init();
  FeatureNotifier.persistAll();
  usePathUrlStrategy();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeViewBloc(),
        child: MaterialApp.router(
          title: 'Calentre',
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.darkTheme(),
          // theme: AppTheme.darkTheme(),
          routerConfig: routerConfig,
        ));
  }
}
