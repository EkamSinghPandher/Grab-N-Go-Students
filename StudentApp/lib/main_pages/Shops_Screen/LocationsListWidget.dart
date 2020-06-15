import './subpages/stall_page.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final double width;
  final double height;
  final String imageLocation;
  final String locationName;

  LocationCard({this.imageLocation, this.locationName, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => new StallPage(),
          ),
        ),
        child: Container(
          width: width,
          child: ListTile(
            title: Image.network(
              imageLocation,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
            subtitle: Container(
              child: Text(locationName),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }
}
