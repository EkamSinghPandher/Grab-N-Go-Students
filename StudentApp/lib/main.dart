import 'package:flutter/material.dart';
import 'package:StudentApp/login/welcome_screen.dart';
import 'package:StudentApp/login/login_screen.dart';
import 'package:StudentApp/login/registration_screen.dart';
import 'package:StudentApp/home/home_screen.dart';

void main() {
  runApp(GrabNGo());
}

class GrabNGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
