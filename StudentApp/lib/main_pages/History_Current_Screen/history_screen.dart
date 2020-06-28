import '../appBar.dart';
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
                          builder: (context) => new CurrentScreen(),
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
            HistoryTile(
              userName: "George",
              userEmail: "george@email.com",
            ),
            HistoryTile(
              userName: "Jason",
              userEmail: "jazzon@email.com",
            ),
          ],
        ),
      ),
    );
  }
}
