import 'package:StudentApp/Models/Food.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/components/foods.dart' as fc;
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  final Vendor shop;
  final List<Food> menu;

  final String studentID;

  FoodPage({this.shop, this.menu, @required this.studentID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Food",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
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
              child: fc.Food(
                vendor: shop,
                foodList: menu,
                studentID: studentID,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
