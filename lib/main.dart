import 'package:flutter/material.dart';
import 'package:pharmaquik/constants.dart';
import 'package:pharmaquik/core/utils/app_router.dart';

void main() {
  runApp(const PharmaQuik());
}

class PharmaQuik extends StatelessWidget {
  const PharmaQuik({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kRoboto,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
