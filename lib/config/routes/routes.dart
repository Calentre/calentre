import 'package:go_router/go_router.dart';
import '../../app/auth/presentation/social_sign_in.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SocialSignIn(),
    ),
  ],
);
