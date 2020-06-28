import 'package:StudentApp/Models/Order.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('History'),
        backgroundColor: Colors.lightBlueAccent,
      ),
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
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchText,
                      decoration: InputDecoration(
                        hintText: "search username",
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0x36FFFFFF),
                            const Color(0x0FFFFFF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                      size: 35.0,
                    ),
                  ),
                ],
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
