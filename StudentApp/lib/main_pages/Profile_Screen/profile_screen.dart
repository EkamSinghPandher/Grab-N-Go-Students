import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Services/auth.dart';
import 'package:StudentApp/main_pages/Profile_Screen/profile_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Student student = Provider.of<Student>(context);
    return Scaffold(
      body: CustomPaint(
        painter: ProfileBackground(),
        child: student == null
            ? CircularProgressIndicator()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 30.0,
                    ),
                    Text(
                      student.name,
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontFamily: "Montserrat",
                        fontSize: 25.0,
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.blue.shade700,
                        ),
                        title: Text(
                          student.email,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16.0,
                            color: Colors.blue.shade700,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: FlatButton(
                            onPressed: () => AuthService().signOut(),
                            child: Text('Sign Out')))
                  ],
                ),
              ),
      ),
    );
  }
}
