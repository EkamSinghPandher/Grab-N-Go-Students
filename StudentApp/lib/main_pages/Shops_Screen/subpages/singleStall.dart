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
    TimeOfDay timeNow = TimeOfDay.now();
    print(timeNow);
    print(shop.closingHour);
    print(shop.openingHour);
    return StreamProvider<List<Food>>(
      create: (_) => DataService().menuFromLocation(shop, shop.loc),
      child: Container(
        child: Card(
          child: Material(
            child: Consumer<List<Food>>(
              builder: (context, provider, child) => InkWell(
                onTap: () => (timeNow.hour > shop.closingHour.hour ||
                        timeNow.hour < shop.openingHour.hour ||
                        (timeNow.hour == shop.closingHour.hour &&
                            timeNow.minute > shop.closingHour.minute) ||
                        (timeNow.hour == shop.openingHour.hour &&
                            timeNow.minute > shop.openingHour.minute))
                    ? null
                    : Navigator.of(context).push(
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
                  child: (timeNow.hour > shop.closingHour.hour ||
                          timeNow.hour < shop.openingHour.hour ||
                          (timeNow.hour == shop.closingHour.hour &&
                              timeNow.minute > shop.closingHour.minute) ||
                          (timeNow.hour == shop.openingHour.hour &&
                              timeNow.minute > shop.openingHour.minute))
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              shop.stallImage,
                              fit: BoxFit.cover,
                              color: Colors.black45,
                              colorBlendMode: BlendMode.darken,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Closed',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )
                      : Image.network(
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
