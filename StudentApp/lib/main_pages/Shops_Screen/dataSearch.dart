import 'package:StudentApp/Models/LocationList.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/singleStall.dart';
import 'package:provider/provider.dart';

import './subpages/stall_page.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final String studentID;
  final recentLocations = [];

  DataSearch(this.studentID);

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on left of the appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on what they selected
    return InkWell(
      onTap: () => Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) => new StallPage(
            location: query,
            studentID: studentID,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final vendorList = Provider.of<List<Vendor>>(context);
    final location =
        Provider.of<List<Location>>(context).map((e) => e.name).toList();
    final locations =
        Provider.of<List<Location>>(context).map((e) => e.name).toList();
    locations.addAll(vendorList.map((e) => e.stallName));
    final suggestionList = query.isEmpty
        ? recentLocations
        : locations.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => location.contains(suggestionList[index])
              ? StallPage(
                  location: suggestionList[index],
                  studentID: studentID,
                )
              : SingleStall(
                  studentID: studentID,
                  shop: vendorList.firstWhere(
                      (element) => element.stallName == suggestionList[index])),
        )),
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
