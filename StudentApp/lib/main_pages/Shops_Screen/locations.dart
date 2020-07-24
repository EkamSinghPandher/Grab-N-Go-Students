import 'package:StudentApp/Models/LocationList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocationCard.dart';

class LocationsList extends StatefulWidget {
  final String studentID;

  const LocationsList({Key key, this.studentID}) : super(key: key);
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
                    studentID: widget.studentID,
                    imageLocation: e.imageURL,
                    locationName: e.name,
                    width: 180,
                    height: 220,
                  ))
              .toList()),
    );
  }
}
