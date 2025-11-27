import 'package:flutter/material.dart';
import 'ui/screens/temperature_screen.dart';
import 'ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  int currentPage = 0;

  void switchPage() {
    setState(() {
      currentPage = 1;
    });
  }

  @override
  Widget build(context) {
    Widget screen = currentPage == 0
        ? WelcomeScreen(onStart: switchPage)
        : TemperatureScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
