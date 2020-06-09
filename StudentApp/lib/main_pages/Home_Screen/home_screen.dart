import 'package:StudentApp/components/horizontal_listView.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  @override
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
            carousel,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Places near you'),
            ),
            HorizontalList(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Promotion'),
            ),
          ],
        ),
      ),
    );
  }

  Widget carousel = new Container(
    height: 150.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/food1.png'),
        AssetImage('images/food2.png'),
      ],
      autoplay: false,
      dotSize: 4.0,
      indicatorBgPadding: 8.0,
    ),
  );
}
