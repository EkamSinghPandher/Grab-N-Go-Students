import 'package:flutter/material.dart';
import 'package:StudentApp/objects/location.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Location(
            imageLocation: 'images/place1.png',
            locationName: 'Fine Foods',
            width: 150.0,
            height: 100.0,
          ),
          Location(
            imageLocation: 'images/place2.png',
            locationName: 'PGP',
            width: 150.0,
            height: 100.0,
          ),
          Location(
            imageLocation: 'images/place3.png',
            locationName: 'Reedz',
            width: 150.0,
            height: 100.0,
          ),
          Location(
            imageLocation: 'images/place4.png',
            locationName: 'Deck',
            width: 150.0,
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
