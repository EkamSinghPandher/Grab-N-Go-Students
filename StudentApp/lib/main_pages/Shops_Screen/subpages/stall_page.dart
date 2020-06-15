import 'package:StudentApp/components/stalls.dart';
import 'package:flutter/material.dart';

class StallPage extends StatefulWidget {
  @override
  _StallPageState createState() => _StallPageState();
}

class _StallPageState extends State<StallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('Shop'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Stalls'),
            ),
            Container(
              height: 550,
              child: Stalls(),
            )
          ],
        ),
      ),
    );
  }
}
