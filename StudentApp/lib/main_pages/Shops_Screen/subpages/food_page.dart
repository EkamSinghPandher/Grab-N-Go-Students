import 'package:StudentApp/Models/Food.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/components/foods.dart' as fc;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatelessWidget {
  final Vendor shop;
  final List<Food> menu;

  FoodPage({
    this.shop,
    this.menu
  });
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
                  child: Image.network(
                    shop.stallImage,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      shop.stallName,
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
              child: fc.Food(foodList:menu),
            ),
          ],
        ),
      ),
    );
  }
}
