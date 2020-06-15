import 'dart:math';

import 'package:StudentApp/Models/Vendor.dart';
import 'package:provider/provider.dart';

import 'horizontal_listView.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  List<Vendor> shuffle(List<Vendor> items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    List<Vendor> vendors = Provider.of<List<Vendor>>(context, listen: false);
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
            carousel(vendors),
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

  //needs geolocation
  Widget carousel(List<Vendor> vendors) {
    return Container(
      height: 150.0,
      child: vendors == null
          ? CircularProgressIndicator()
          : new Carousel(
              boxFit: BoxFit.cover,
              images: shuffle(vendors)
                  .take(8)
                  .toList()
                  .map((e) => Image.network(e.stallImage))
                  .toList(),
              autoplay: false,
              dotSize: 4.0,
              indicatorBgPadding: 8.0,
            ),
    );
  }
}
