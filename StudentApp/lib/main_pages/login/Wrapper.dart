import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/main_pages/Home_Screen/page_logic.dart';
import 'package:StudentApp/main_pages/login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  static const id = 'Wrapper_screen';
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final Student user = Provider.of<Student>(context);
    return user == null ? WelcomeScreen() : PageLogic();
  }
}
