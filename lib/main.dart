import 'package:calentre/config/constants/constants.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/themes.dart';
import 'package:calentre/injection_container.dart';
import 'package:calentre/secrets.dart';
import 'package:feature_notifier/feature_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: RemoteURLs.supabaseUrl,
    anonKey: Secrets.supabseSecret,
  );
  await initializeDependencies();
  await FeatureNotifier.init();
  FeatureNotifier.persistAll();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeViewBloc>(
            create: (context) => HomeViewBloc(),
          ),
          BlocProvider<CalentreEventBloc>(
            create: (context) => CalentreEventBloc(),
          )
        ],
        child: MaterialApp.router(
          title: 'Calentre',
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.darkTheme(),
          routerConfig: routerConfig,
        ));
  }
}
// flutter run -d chrome --web-port 5555