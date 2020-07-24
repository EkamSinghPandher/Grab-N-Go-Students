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
            appBar: topBar(
              context,
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch(stud.uid));
                },
              ),
              "Locations",
            ),
            body: CustomPaint(
              painter: ShopBackground(),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: LocationsList(studentID: stud.uid),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
