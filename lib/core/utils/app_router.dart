// ignore_for_file: unused_import

import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:pharmaquik/features/Home/presentation/view/main_view.dart';
import 'package:pharmaquik/features/Splash/presentation/views/on_boarding_view.dart';
import 'package:pharmaquik/features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainHome';
  static const kOnBoarding = '/onBoarding';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kMainView,
      builder: (context, state) => const MainHome(),
    ),
    GoRoute(
      path: kOnBoarding,
      builder: (context, state) => const OnBoardingView(),
    ),
  ]);
}
