import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 2,
    ),
  )..forward();

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _animationController,
    curve: Curves.bounceOut,
  );

  late Animation<double> _progress = Tween<double>(
    begin: 0.005,
    end: 1.5,
  ).animate(_curve);

  void _animateValues() {
    final newBegin = _progress.value;
    final random = Random();
    final newEnd = random.nextDouble() * 2.0;
    setState(() {
      _progress = Tween(begin: newBegin, end: newEnd).animate(_curve);
    });
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
        child: AnimatedBuilder(
          animation: _curve,
          builder: (context, child) {
            return CustomPaint(
              painter: AppleWatchPainter(
                progress: _progress.value,
              ),
              size: const Size(400, 400),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateValues,
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  final double progress;

  AppleWatchPainter({required this.progress});

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

    final blueCircleRadius = (size.width / 2) * 0.62;
    //draw blue
    final blueCirclePaint = Paint()
      ..color = Colors.cyan.shade500.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;
    canvas.drawCircle(
      center,
      blueCircleRadius,
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
      progress * pi,
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
      progress * pi * 0.6,
      false,
      greenArcPaint,
    );

    //blue arc
    final blueArcRect = Rect.fromCircle(
      center: center,
      radius: blueCircleRadius,
    );
    final blueArcPaint = Paint()
      ..color = Colors.blue.shade500
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 25;
    canvas.drawArc(
      blueArcRect,
      startingAngle,
      progress * pi * 0.8,
      false,
      blueArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
