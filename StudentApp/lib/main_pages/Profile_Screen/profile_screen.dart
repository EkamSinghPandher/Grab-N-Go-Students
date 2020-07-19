import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Services/auth.dart';
import 'package:StudentApp/main_pages/appBar.dart';
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
      body: student == null
          ? CircularProgressIndicator()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                  ),
                  SizedBox(
                    width: 150,
                    height: 20.0,
                    child: Divider(
                      color: Colors.blue.shade200,
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.blue.shade700,
                      ),
                      title: Text(
                        student.email,
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 19.0,
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
    );
  }
}
