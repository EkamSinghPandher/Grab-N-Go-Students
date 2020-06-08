import 'package:StudentApp/Services/auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('Profile'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Center(
          child: FlatButton(onPressed: () =>AuthService().signOut(), child: Text('Sign Out')),
        ),
      ),
    );
  }
}
