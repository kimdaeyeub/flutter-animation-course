import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 4,
    ),
  );

  void _play() {
    _animationController.forward();
  }

  void _pause() {
    _animationController.stop();
  }

  void _rewind() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explicit Animation",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_animationController.value}",
              style: const TextStyle(
                fontSize: 60,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _play,
                  child: const Text(
                    "Play",
                  ),
                ),
                ElevatedButton(
                  onPressed: _pause,
                  child: const Text(
                    "Pause",
                  ),
                ),
                ElevatedButton(
                  onPressed: _rewind,
                  child: const Text(
                    "Rewind",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
