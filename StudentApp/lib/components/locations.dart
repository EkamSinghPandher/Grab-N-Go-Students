import 'package:flutter/material.dart';
import 'package:StudentApp/components/loc.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Location(
            imageLocation: 'images/place1.png',
            locationName: 'Fine Foods',
            width: 300.0,
            height: 200.0,
          ),
          Location(
            imageLocation: 'images/place2.png',
            locationName: 'PGP',
            width: 300.0,
            height: 200.0,
          ),
          Location(
            imageLocation: 'images/place3.png',
            locationName: 'Reedz',
            width: 300.0,
            height: 200.0,
          ),
          Location(
            imageLocation: 'images/place4.png',
            locationName: 'Deck',
            width: 300.0,
            height: 200.0,
          ),
        ],
      ),
    );
  }
}
