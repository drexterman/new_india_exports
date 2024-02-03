import 'package:flutter/material.dart';
import 'package:login_flutter/ui/onboarding_screen.dart';
import 'package:login_flutter/ui/LandingPage.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(255, 236, 231, 223),
        ),
      ),
      home: LandingPage(),
    );
  }
}
