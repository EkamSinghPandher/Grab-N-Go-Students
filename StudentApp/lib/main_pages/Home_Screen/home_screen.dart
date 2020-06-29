import 'package:StudentApp/main_pages/appBar.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:provider/provider.dart';

import 'carousell.dart';
import 'horizontal_listView.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  Widget build(BuildContext context) {
    Student stud = Provider.of<Student>(context);
    return stud == null
        ? CircularProgressIndicator()
        : Scaffold(
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
                  HorizontalList(
                    studentID: stud.uid,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Promotion'),
                  ),
                ],
              ),
            ),
          );
  }
}
