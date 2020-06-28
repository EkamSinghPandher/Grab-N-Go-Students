import 'package:StudentApp/main_pages/appBar.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:provider/provider.dart';

import 'carousell.dart';
import 'horizontal_listView.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  int current = 0;
  Widget build(BuildContext context) {
    Student stud = Provider.of<Student>(context);
    return Scaffold(
      appBar: topBar(context, null),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Carousell(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Places near you'),
            ),
            HorizontalList(studentID: stud.uid,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Promotion'),
            ),
            RaisedButton(
              onPressed: () {
                getLocation();
              },
              child: Text("Get Location"),
            )
          ],
        ),
      ),
    );
  }
}
