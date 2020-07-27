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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    List<ChatTile> curr = widget.orderList
        .where((element) => element.isCollected == false)
        .toList()
        .map((e) => ChatTile(
              height: height * 0.28,
              width: width,
              order: e,
            ))
        .toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: height * 0.1,
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
            SizedBox(
              height: height * 0.02,
            ),
            Container(
                alignment:
                    curr.isEmpty ? Alignment.center : Alignment.topCenter,
                height: height * 0.79,
                child: SingleChildScrollView(
                  child: curr.isEmpty
                      ? Text(
                          'No pending orders',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              fontSize: 24),
                        )
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
