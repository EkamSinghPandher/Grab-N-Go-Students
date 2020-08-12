import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/stall_page.dart';
import 'package:flutter/material.dart';

class NearLocations extends StatelessWidget {
  final double width;
  final double height;
  final String imageLocation;
  final String locationName;

  final Student student;

  NearLocations(
      {this.imageLocation,
      this.locationName,
      this.width,
      this.height,
      @required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => new StallPage(
              location: locationName,
              student: student,
            ),
          ),
        ),
        child: Container(
          width: width * 1.2,
          child: Container(
            margin: EdgeInsets.only(bottom: 25),
            child: ListTile(
              title: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageLocation,
                  width: width * 1.2,
                  height: height * 1.2,
                  fit: BoxFit.fill,
                ),
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  locationName,
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
