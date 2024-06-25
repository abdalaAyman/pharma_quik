import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/features/provider_controller/provider_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'package:flutter/services.dart';

class PharmaQuik extends StatelessWidget {
  final AppRouter appRouter;
  const PharmaQuik({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => FavoriteProvider(),
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            title: 'pharma quik App',
            theme: ThemeData(
                fontFamily: kRoboto,
                scaffoldBackgroundColor: kPrimaryColor,
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: (SystemUiOverlayStyle.dark.copyWith(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                )))),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.SplashView,
            onGenerateRoute: appRouter.generateRoute,
          ),
        ));
  }
}
