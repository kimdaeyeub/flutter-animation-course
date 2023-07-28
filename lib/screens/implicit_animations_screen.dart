import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Implicit Animation",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedAlign(
              alignment: _visible ? Alignment.topLeft : Alignment.topRight,
              duration: const Duration(
                milliseconds: 300,
              ),
              child: AnimatedOpacity(
                duration: const Duration(
                  milliseconds: 300,
                ),
                opacity: _visible ? 1 : 0,
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.5,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _trigger,
              child: const Text(
                "Go",
              ),
            )
          ],
        ),
      ),
    );
  }
}
