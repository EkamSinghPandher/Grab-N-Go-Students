import '../appBar.dart';
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
    List<HistoryTile> history = orders == null
        ? []
        : orders
            .where((element) => element.isCollected == true)
            .toList()
            .map((e) => HistoryTile(
                  order: e,
                ))
            .toList();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 45),
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
          Container(
              height: 100,
              alignment: Alignment.center,
              child: history.isEmpty
                  ? Text('No History')
                  : SingleChildScrollView(child: Column(children: history))),
        ],
      ),
    );
  }
}
