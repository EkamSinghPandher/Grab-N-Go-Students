import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/purchase_food_page.dart';
import 'package:flutter/material.dart';
import 'package:StudentApp/Models/Food.dart' as fd;

class Food extends StatelessWidget {
  final List<fd.Food> foodList;
  final Vendor vendor;

  final Student student;

  const Food({this.foodList, @required this.vendor, @required this.student});

  @override
  Widget build(BuildContext context) {
    var foodMap = foodList
        .map((e) =>
            {'name': e.foodName, 'picture': e.foodImage, 'price': e.foodPrice})
        .toList();
    return GridView.builder(
      itemCount: foodList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleFood(
          student: student,
          food: foodList[index],
          name: foodMap[index]['name'],
          picture: foodMap[index]['picture'],
          price: foodMap[index]['price'] == null ? 0 : foodMap[index]['price'],
          vendor: vendor,
        );
      },
    );
  }
}

class SingleFood extends StatelessWidget {
  final fd.Food food;
  final Vendor vendor;
  final name;
  final picture;
  final price;
  final Student student;

  SingleFood(
      {this.name,
      this.picture,
      this.price,
      this.vendor,
      this.food,
      this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Material(
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: PurchaseFood(
                      vendor: vendor,
                      food: food,
                      student: student,
                    ),
                  ),
                ),
              );
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    Text(
                      name,
                    ),
                    Text(
                      '\$ ' + (price / 100).toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              child: Image.network(
                picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
