import './subpages/stall_page.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final double width;
  final double height;
  final String imageLocation;
  final String locationName;

  final String studentID;

  LocationCard({this.imageLocation, this.locationName, this.width, this.height, @required this.studentID});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => new StallPage(location: locationName, studentID: studentID,),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFB0CCE1).withOpacity(0.32),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 25),
            child: ListTile(
              title: Image.network(
                imageLocation,
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(locationName),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
