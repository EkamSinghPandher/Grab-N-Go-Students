<<<<<<< HEAD
import 'package:StudentApp/main_pages/appBar.dart';
=======
import 'package:StudentApp/Models/Student.dart';
import 'package:provider/provider.dart';
>>>>>>> OrderSystems

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
<<<<<<< HEAD
    return Scaffold(
      appBar: topBar(
          context,
=======
    Student stud = Provider.of<Student>(context);
    return stud == null? CircularProgressIndicator():
    Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
>>>>>>> OrderSystems
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
<<<<<<< HEAD
                showSearch(context: context, delegate: DataSearch());
              })),
=======
                showSearch(context: context, delegate: DataSearch(stud.uid));
              }),
        ],
        title: Text('Shop'),
        backgroundColor: Colors.lightBlueAccent,
      ),
>>>>>>> OrderSystems
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kInputDecoration,
                onChanged: (value) {
                  setState(() {
                    foodOrLocation = value;
                  });
                },
              ),
            ),*/
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Locations'),
            ),
            Container(
<<<<<<< HEAD
              height: MediaQuery.of(context).size.height * 0.73,
              child: LocationsList(),
=======
              height: MediaQuery.of(context).size.height*0.73,
              child: LocationsList(studentID:stud.uid),
>>>>>>> OrderSystems
            )
          ],
        ),
      ),
    );
  }
}
