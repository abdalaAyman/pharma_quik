import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmaquik/constants.dart';
import 'package:pharmaquik/core/routing/app_router.dart';
import 'package:pharmaquik/core/routing/routes.dart';

class PharmaQuik extends StatelessWidget {
  final AppRouter appRouter;
  const PharmaQuik({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'pharma quik App',
        theme: ThemeData(
          fontFamily: kRoboto,
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SplashView,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
