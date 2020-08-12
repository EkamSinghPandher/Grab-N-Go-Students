import 'package:StudentApp/Models/Food.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/components/foods.dart' as fc;
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  final Vendor shop;
  final List<Food> menu;

  final Student student;

  FoodPage({this.shop, this.menu, @required this.student});
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
            color: Colors.blue.shade800,
            fontFamily: "Montserrat",
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 200.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    shop.stallImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                shop.stallName,
                style: TextStyle(fontSize: 23, fontFamily: 'Montserrat'),
              ),
            ),
            Container(
              height: 300,
              child: fc.Food(
                vendor: shop,
                foodList: menu,
                student: student,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
