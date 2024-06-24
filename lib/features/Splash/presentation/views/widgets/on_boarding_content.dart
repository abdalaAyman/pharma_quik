import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBordingContent extends StatelessWidget {
  const OnBordingContent({
    super.key,
    required this.image,
    required this.title,
    required this.height,
    required this.width,
    required this.headTitle,
  });
  final String title, headTitle, image;
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              headTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFA8A8A9),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
