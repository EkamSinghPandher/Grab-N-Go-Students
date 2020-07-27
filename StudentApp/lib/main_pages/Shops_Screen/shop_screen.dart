import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/main_pages/Shops_Screen/shops_background.dart';
import 'package:StudentApp/main_pages/appBar.dart';
import 'package:provider/provider.dart';

import 'dataSearch.dart';
import 'package:flutter/material.dart';
import 'locations.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String foodOrLocation;
  @override
  Widget build(BuildContext context) {
    Student stud = Provider.of<Student>(context);
    return stud == null
        ? CircularProgressIndicator()
        : Scaffold(
            body: CustomPaint(
              painter: ShopBackground(),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Locations",
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontFamily: 'Montserrat',
                              fontSize: 30.0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: DataSearch(stud.uid));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: LocationsList(studentID: stud.uid),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
