// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 0, left: 25, right: 25),
          child: OnBordingViewbody(),
        ),
      ),
    );
  }
}
