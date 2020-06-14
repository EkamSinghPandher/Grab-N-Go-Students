import 'package:StudentApp/Models/User.dart';
import 'package:StudentApp/Services/auth.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:StudentApp/main_pages/login/login_screen.dart';
import 'package:StudentApp/main_pages/login/registration_screen.dart';
import 'package:StudentApp/main_pages/login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/Student.dart';
import 'package:StudentApp/main_pages/Home_Screen/page_logic.dart';
import 'main_pages/login/Wrapper.dart';

void main() {
  runApp(GrabNGo());
}

class GrabNGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      create: (_) => AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
          routes: {
            Wrapper.id: (context) => Wrapper(),
            WelcomeScreen.id: (context) => WelcomeScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            PageLogic.id: (context) => PageLogic(),
          },
        )
    );
  }
}
