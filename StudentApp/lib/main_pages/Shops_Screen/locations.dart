import 'package:StudentApp/Models/LocationList.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocationCard.dart';

class LocationsList extends StatefulWidget {
  final Student student;

  const LocationsList({Key key, @required this.student}) : super(key: key);
  @override
  _LocationsListState createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  @override
  Widget build(BuildContext context) {
    List<Location> locations = Provider.of<List<Location>>(context);
    return Container(
      child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: locations
              .map((e) => LocationCard(
                    student: widget.student,
                    imageLocation: e.imageURL,
                    locationName: e.name,
                    width: 180,
                    height: 220,
                  ))
              .toList()),
    );
  }
}
