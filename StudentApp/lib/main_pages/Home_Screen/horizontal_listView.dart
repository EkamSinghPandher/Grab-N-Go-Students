import 'package:StudentApp/Models/LocationList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Shops_Screen/LocationCard.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    List<Location> locations = Provider.of<List<Location>>(context);
    return locations == null
        ? CircularProgressIndicator()
        : Container(
            alignment: Alignment.center,
            height: 110.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                //wait for geotagging to link to locations
                children: locations
                    .map((e) => LocationCard(
                          imageLocation: e.imageURL,
                          locationName: e.name,
                          width: 160,
                          height: 80,
                        ))
                    .toList()),
          );
  }
}
