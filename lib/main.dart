import 'package:flutter/material.dart';
import 'package:flutter_animation_masterclass/screens/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Animation MasterClass",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
        ),
      ),
      home: const MenuScreen(),
    );
  }
}
