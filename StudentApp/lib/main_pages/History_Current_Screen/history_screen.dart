import 'package:StudentApp/Models/Order.dart';
import 'package:provider/provider.dart';

import 'historyTile.dart';
import 'current_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    List<Order> orders = Provider.of<List<Order>>(context);
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
                  Text(
                    "HISTORY",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) =>
                              new CurrentScreen(orderList: orders),
                        ),
                      );
                    },
                    child: Text(
                      "CURRENT",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
                child: SingleChildScrollView(
                    child: Column(
                        children: orders == null? [] : orders
                            .where((element) => element.isCollected == true)
                            .toList()
                            .map((e) => HistoryTile(
                                  order: e,
                                ))
                            .toList()))),
          ],
        ),
      ),
    );
  }
}
