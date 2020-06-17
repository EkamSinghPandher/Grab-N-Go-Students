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
    return Scaffold(
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
        title: Text('Home'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Carousell(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Places near you'),
            ),
            HorizontalList(),
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
