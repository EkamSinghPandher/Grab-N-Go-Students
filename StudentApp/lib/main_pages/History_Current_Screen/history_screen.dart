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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    List<HistoryTile> history = orders == null
        ? []
        : orders
            .where((element) => element.isCollected == true)
            .toList()
            .map((e) => HistoryTile(
                  height: height * 0.28,
                  order: e,
                  width: width,
                ))
            .toList();
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: height * 0.1,
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
            height: height * 0.02,
          ),
          Container(
              height: height * 0.79,
              alignment:
                  history.isEmpty ? Alignment.center : Alignment.topCenter,
              child: history.isEmpty
                  ? Text(
                      'No order history',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 24),
                    )
                  : SingleChildScrollView(child: Column(children: history))),
        ],
      ),
    );
  }
}
