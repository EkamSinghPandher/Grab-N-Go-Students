import 'package:StudentApp/components/foods.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  final shopName;
  final shopPicture;

  FoodPage({this.shopName, this.shopPicture});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
            },
          ),
        ],
        title: Text('Food'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 250.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    widget.shopPicture,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.shopName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: Food(),
            ),
          ],
        ),
      ),
    );
  }
}
