import "dart:math";
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  DateTime dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.width / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
//full circle
    final circle_paint = Paint()..color = Colors.blue;

    canvas.drawCircle(center, radius, circle_paint);
//seconds line
    final sec_line = Paint()

      // ignore: prefer_const_constructors
      ..shader = RadialGradient(
        colors: const [Colors.pink, Colors.purple],
      ).createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    //seconds
    var secX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secY = centerY + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secX, secY), sec_line);
//hour line
    final hr_line = Paint()
      // ignore: prefer_const_constructors
      ..shader = RadialGradient(
        colors: const [Color.fromARGB(255, 255, 255, 255), Colors.white30],
      ).createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    //hour
    var hrX = centerX +
        40 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hrY = centerY +
        40 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hrX, hrY), hr_line);
//min line
    final min_line = Paint()
      // ignore: prefer_const_constructors
      ..shader = RadialGradient(
        colors: const [Color.fromARGB(255, 255, 255, 255), Colors.white30],
      ).createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    //minute
    var minX = centerX + 70 * cos(dateTime.minute * 6 * pi / 180);
    var minY = centerY + 70 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minX, minY), min_line);

//inner cirlce

    final center_paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255);
    canvas.drawCircle(center, 6, center_paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
