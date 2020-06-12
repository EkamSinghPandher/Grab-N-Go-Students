import 'package:StudentApp/subpages/stall_page.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final locations = [
    "Deck",
    "BizCafe",
    "Reedz",
    "Fine Foods",
    "Science",
    "Computing",
    "PGP",
    "Supper Stretch",
    "Tea Party",
    "Gong Cha",
    "Subway",
    "Engineering",
    "Medicine",
  ];

  final recentLocations = [
    "Reedz",
    "Fine Foods",
    "Science",
  ];

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
          builder: (context) => new StallPage(),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentLocations
        : locations.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
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
