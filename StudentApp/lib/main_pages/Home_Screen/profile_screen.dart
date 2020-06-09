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
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.blue.shade700,
                ),
                title: Text(
                  '+65 91234567',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue.shade700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.blue.shade700,
                ),
                title: Text(
                  'nus-student@gmail.com',
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
          child: FlatButton(onPressed: () =>AuthService().signOut(), child: Text('Sign Out')))
          ],
        ),
      ),
    );
  }
}
