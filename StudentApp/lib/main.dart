import 'package:StudentApp/Models/LocationList.dart';
import 'package:StudentApp/Models/User.dart';
import 'package:StudentApp/Services/auth.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:StudentApp/main_pages/login/login_screen.dart';
import 'package:StudentApp/main_pages/login/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:StudentApp/main_pages/page_logic.dart';
import 'Models/Vendor.dart';
import 'main_pages/login/Wrapper.dart';

void main() {
  runApp(GrabNGo());
}

class GrabNGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        create: (_) => AuthService().user,
        child: StreamProvider<List<Location>>(
          create: (_) => DataService().locations,
          child: StreamProvider<List<Vendor>>(
            create: (_) => DataService().vendors,
            child: MaterialApp(
              home: Wrapper(),
              routes: {
                Wrapper.id: (context) => Wrapper(),
                LoginScreen.id: (context) => LoginScreen(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
                PageLogic.id: (context) => PageLogic(),
              },
            ),
          ),
        ));
  }
}
