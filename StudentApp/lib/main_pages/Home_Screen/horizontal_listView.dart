import 'dart:math';

import 'package:StudentApp/Models/LocationList.dart';
import 'package:StudentApp/main_pages/Home_Screen/near_you_locations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Shops_Screen/LocationCard.dart';
import 'package:geolocator/geolocator.dart';

class HorizontalList extends StatefulWidget {
  final String studentID;

  const HorizontalList({Key key, this.studentID}) : super(key: key);
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Position current;
  bool isLoading = true;

  List<Location> geoSort(List<Location> list) {
    list.sort(
      (a, b) => distanceTo(a, current).compareTo(distanceTo(b, current)),
    );
    return list;
  }

  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      current = position;
      isLoading = false;
    });
  }

  double distanceTo(Location geo, Position current) {
    double x = geo.location.latitude - current.latitude;
    double y = geo.location.longitude - current.longitude;
    return sqrt(x * x + y * y);
  }

  @override
  Widget build(BuildContext context) {
    List<Location> locations = Provider.of<List<Location>>(context);
    getLocation();
    return (locations == null || isLoading)
        ? CircularProgressIndicator()
        : Container(
            alignment: Alignment.center,
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //wait for geotagging to link to locations
              children: geoSort(locations)
                  .map(
                    (e) => NearLocations(
                      studentID: widget.studentID,
                      imageLocation: e.imageURL,
                      locationName: e.name,
                      width: 160,
                      height: 80,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
