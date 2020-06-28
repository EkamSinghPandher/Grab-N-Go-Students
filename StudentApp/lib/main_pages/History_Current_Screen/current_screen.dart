import 'package:StudentApp/main_pages/appBar.dart';
import 'package:StudentApp/Models/Order.dart';

import 'chatTile.dart';
import 'package:flutter/material.dart';

class CurrentScreen extends StatefulWidget {
  final List<Order> orderList;

  const CurrentScreen({Key key, this.orderList}) : super(key: key);
  @override
  _CurrentScreenState createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  TextEditingController searchText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context, null),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "HISTORY",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Text(
                    "CURRENT",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: "Search Username"),
              ),
            ),
            Container(
                child: SingleChildScrollView(
              child: Column(
                  children: widget.orderList == null
                      ? null
                      : widget.orderList
                          .where((element) => element.isCollected == false)
                          .toList()
                          .map((e) => ChatTile(
                                order: e,
                              ))
                          .toList()),
            ))
          ],
        ),
      ),
    );
  }
}
