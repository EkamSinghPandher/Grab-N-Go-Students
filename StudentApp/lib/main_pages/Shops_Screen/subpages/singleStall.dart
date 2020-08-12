import 'package:StudentApp/Models/Food.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleStall extends StatelessWidget {
  final Vendor shop;

  final Student student;

  SingleStall({this.shop, @required this.student});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Food>>(
      create: (_) => DataService().menuFromLocation(shop, shop.loc),
      child: Container(
        child: Card(
          child: Material(
            child: Consumer<List<Food>>(
              builder: (context, provider, child) => InkWell(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (_) => new FoodPage(
                      shop: shop,
                      menu: provider,
                      student: student,
                    ),
                  ),
                ),
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        shop.stallName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: Image.network(
                    shop.stallImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
