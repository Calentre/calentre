import 'package:calentre/app/events/presentation/create_event.dart';
import 'package:calentre/app/home/presentation/calentre_home.dart';
import 'package:go_router/go_router.dart';
import '../../app/auth/presentation/social_sign_in.dart';

class AppRoutes {
  static String socialSignIn = 'socialSignIn';
  static String calentreHome = 'calentreHome';
  static String createEvent = 'createEvent';
}

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      name: AppRoutes.socialSignIn,
      path: '/',
      builder: (context, state) => const SocialSignIn(),
    ),
    GoRoute(
      name: AppRoutes.calentreHome,
      path: '/home',
      builder: (context, state) => const CalentreHome(),
    ),
    GoRoute(
      name: AppRoutes.createEvent,
      path: '/create-event',
      builder: (context, state) => const CreateEventView(),
    ),
  ],
);
