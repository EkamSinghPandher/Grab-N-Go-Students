import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:provider/provider.dart';

import 'stalls.dart';
import 'package:flutter/material.dart';

class StallPage extends StatelessWidget {
  final String location;

  final String studentID;

  const StallPage({@required this.location, @required this.studentID});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Vendor>>(
      create: (_) => DataService().vendorsFromLocation(location),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //Implement logout functionality
                }),
          ],
          title: Text('Shop'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Stalls'),
              ),
              Container(
                height: 550,
                child: Stalls(studentID: studentID),
              )
            ],
          ),
        ),
      ),
    );
  }
}
