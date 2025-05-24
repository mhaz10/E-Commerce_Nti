import 'package:ecommerce_nti/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_nti/features/auth/presentation/views/register_view.dart';
import 'package:ecommerce_nti/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_nti/features/onBoarding/views/get_started.dart';
import 'package:ecommerce_nti/features/onBoarding/views/onboarding_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/views/splash_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static const kOnBoarding = '/OnBoardingView';
  static const kGetStarted = '/GetStarted';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kHomeView = '/HomeView';

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnboardingView(),
      ),

      GoRoute(
        path: kGetStarted,
        builder: (context, state) => const GetStarted(),
      ),

      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}