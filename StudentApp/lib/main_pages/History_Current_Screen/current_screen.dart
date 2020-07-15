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
    List<ChatTile> curr = widget.orderList
        .where((element) => element.isCollected == false)
        .toList()
        .map((e) => ChatTile(
              order: e,
            ))
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
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
                child: SingleChildScrollView(
              child: curr.isEmpty
                  ? Text('No orders right now')
                  : Column(
                      children: curr,
                    ),
            ))
          ],
        ),
      ),
    );
  }
}
