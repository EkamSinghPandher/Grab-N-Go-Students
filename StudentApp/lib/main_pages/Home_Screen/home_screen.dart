import 'package:StudentApp/main_pages/Home_Screen/home_background.dart';
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
            appBar: topBar(context, null, "Discover"),
            body: CustomPaint(
              painter: HomeBackground(),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Carousell(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: Colors.blue.shade800,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Places near you',
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HorizontalList(
                      studentID: stud.uid,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
