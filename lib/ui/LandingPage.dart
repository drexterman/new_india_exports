import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_flutter/ui/home.dart';
import 'package:login_flutter/ui/onboarding_screen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    checkUserSession();
  }

  Future<void> checkUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    // Use a Future.delayed to simulate a splash screen effect
    await Future.delayed(Duration(milliseconds: 500));

    if (userToken != null) {
      // User is already authenticated, proceed to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } else {
      // User needs to log in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => intro(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/Logo.png"),
      ),
    );
  }
}