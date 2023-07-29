import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Apple Watch",
        ),
      ),
      body: Center(
        child: CustomPaint(
          painter: AppleWatchPainter(),
          size: const Size(400, 400),
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final redCircleRadius = (size.width / 2) * 0.9;
    const startingAngle = -0.5 * pi;
    //draw red
    final redCirclePaint = Paint()
      ..color = Colors.red.shade500.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;
    canvas.drawCircle(
      center,
      redCircleRadius,
      redCirclePaint,
    );

    final greenCircleRadius = (size.width / 2) * 0.76;
    //draw green
    final greenCirclePaint = Paint()
      ..color = Colors.green.shade500.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;
    canvas.drawCircle(
      center,
      greenCircleRadius,
      greenCirclePaint,
    );

    //draw blue
    final blueCirclePaint = Paint()
      ..color = Colors.cyan.shade500.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;
    canvas.drawCircle(
      center,
      (size.width / 2) * 0.62,
      blueCirclePaint,
    );

    //red arc
    final redArcRect = Rect.fromCircle(
      center: center,
      radius: redCircleRadius,
    );
    final redArcPaint = Paint()
      ..color = Colors.red.shade500
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 25;
    canvas.drawArc(
      redArcRect,
      startingAngle,
      1.5 * pi,
      false,
      redArcPaint,
    );

    //green arc
    final greenArcRect = Rect.fromCircle(
      center: center,
      radius: greenCircleRadius,
    );
    final greenArcPaint = Paint()
      ..color = Colors.green.shade500
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 25;
    canvas.drawArc(
      greenArcRect,
      startingAngle,
      1.0 * pi,
      false,
      greenArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
