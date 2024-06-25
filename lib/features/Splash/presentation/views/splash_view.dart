import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/utils/assets_data.dart';
import 'on_boarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingView()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 237, 240, 242),
          Color.fromARGB(255, 227, 224, 225)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AssetsData.fullLogo),
          Positioned(top: 0, right: 0, child: Image.asset(AssetsData.splash1)),
          Positioned(
              top: 600, right: 0, child: Image.asset(AssetsData.splash2)),
          Positioned(
              bottom: 0, left: 0, child: Image.asset(AssetsData.splash3)),
        ],
      ),
    );
  }
}
