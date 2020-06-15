import 'package:StudentApp/Models/LocationList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocationsListWidget.dart';

class LocationsList extends StatefulWidget {
  @override
  _LocationsListState createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  @override
  Widget build(BuildContext context) {
    List<Location> locations = Provider.of<List<Location>>(context);
    return Container(
      child: ListView(
          scrollDirection: Axis.vertical,
          children: locations
              .map((e) => LocationCard(
                    imageLocation: e.imageURL,
                    locationName: e.name,
                    width: 180,
                    height: 220,
                  ))
              .toList()),
    );
  }
}
