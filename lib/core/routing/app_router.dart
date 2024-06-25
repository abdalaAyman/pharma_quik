import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/routing/routes.dart';
import 'package:flutter_application_2/features/Home/presentation/view/home_view.dart';
import 'package:flutter_application_2/features/Home/presentation/view/main_view.dart';
import 'package:flutter_application_2/features/Home/presentation/view/preview_view.dart';
import '../../features/Home/presentation/view/add_sec_med_view.dart';
import '../../features/Home/presentation/view/alarm_veiw.dart';
import '../../features/Home/presentation/view/interacion_view.dart';
import '../../features/Home/presentation/view/save_view.dart';
import '../../features/Splash/presentation/views/on_boarding_view.dart';
import '../../features/Splash/presentation/views/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this(arguments as className)
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.OnBoardingView:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.HomeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.SplashView:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.MainView:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );
      case Routes.SaveView:
        return MaterialPageRoute(
          builder: (_) => SaveView(),
        );
      case Routes.AlarmView:
        return MaterialPageRoute(
          builder: (_) => const AlarmView(),
        );
      // case Routes.FindMedicine:
      //   return MaterialPageRoute(builder: (_) => FindMedicine());
      case Routes.SecondMedicine:
        return MaterialPageRoute(
          builder: (_) => const SecondMedicine(),
        );
      case Routes.InteractionView:
        return MaterialPageRoute(
          builder: (_) => InteractionView(
            Name1: '',
            Name2: '',
            interactions: '',
          ),
        );
      case Routes.PreviewViewBody:
        return MaterialPageRoute(
          builder: (_) => const PreviewViewBody(
            name: '',
            pageName: '',
            details: '',
          ),
        );
      default:
        return null;
    }
  }
}
