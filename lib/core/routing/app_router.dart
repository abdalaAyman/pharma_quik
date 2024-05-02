import 'package:flutter/material.dart';
import 'package:pharmaquik/core/routing/routes.dart';
import 'package:pharmaquik/features/Home/presentation/view/main_view.dart';

import '../../features/Splash/presentation/views/on_boarding_view.dart';
import '../../features/Splash/presentation/views/splash_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this(arguments as className)
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.OnBoardingView:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.SplashView:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.MainView:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
