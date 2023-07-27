import 'package:calentre/app/completion/completion_feedback.dart';
import 'package:calentre/app/events/presentation/pages/create_event.dart';
import 'package:calentre/app/home/presentation/calentre_home.dart';
import 'package:calentre/app/payments/presentation/widgets/payment_details_fields.dart';
import 'package:calentre/app/set_availability/presentation/set_availability_view.dart';
import 'package:go_router/go_router.dart';
import '../../app/auth/presentation/social_sign_in.dart';

class AppRoutes {
  static String socialSignIn = 'socialSignIn';
  static String calentreHome = 'calentreHome';
  static String createEvent = 'createEvent';
  static String setAvailabilityView = 'setAvailability';
  static String completionFeedBack = 'completionFeedBack';
  static String addPaymentDetailsModal = 'addPaymentDetailsModal';
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
    GoRoute(
      name: AppRoutes.setAvailabilityView,
      path: '/set-availability',
      builder: (context, state) => SetAvailabilityView(),
    ),
    GoRoute(
      name: AppRoutes.completionFeedBack,
      path: '/completion-feedback',
      builder: (context, state) => const CompletionFeedBackView(),
    ),
    GoRoute(
      name: AppRoutes.addPaymentDetailsModal,
      path: '/add-payment-details',
      builder: (context, state) => const AddPaymentDetailsModal(),
    ),
  ],
);
