import 'package:flutter/material.dart';
import 'package:StudentApp/constants.dart';
import 'package:StudentApp/components/locations.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String foodOrLocation;
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
        title: Text('Shop'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
            ),
            Center(
              child: Text('he searched up $foodOrLocation'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Locations'),
            ),
            Container(
              height: 370.0,
              child: Locations(),
            )
          ],
        ),
      ),
    );
  }
}