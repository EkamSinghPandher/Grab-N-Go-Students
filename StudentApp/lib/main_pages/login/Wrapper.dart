import 'package:StudentApp/Models/User.dart';
import 'package:StudentApp/main_pages/login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../page_logic.dart';

class Wrapper extends StatefulWidget {
  static const id = 'Wrapper_screen';
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return user == null ? WelcomeScreen() : PageLogic();
  }
}
