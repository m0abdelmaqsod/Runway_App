import 'package:flutter/material.dart';
import 'package:runway/splash/splash_screen.dart';

void main() {
  runApp(Runway());
}

class Runway extends StatelessWidget {
  const Runway({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}