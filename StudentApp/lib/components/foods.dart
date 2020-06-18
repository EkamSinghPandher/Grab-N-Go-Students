import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/purchase_food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:StudentApp/Models/Food.dart' as fd;

class Food extends StatelessWidget {
  final List<fd.Food> foodList;

  const Food({this.foodList});

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
          name: foodMap[index]['name'],
          picture: foodMap[index]['picture'],
          price: foodMap[index]['price'],
        );
      },
    );
  }
}

class SingleFood extends StatelessWidget {
  final name;
  final picture;
  final price;

  SingleFood({this.name, this.picture, this.price});

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
                    child: PurchaseFood(),
                  ),
                ),
              );
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    name,
                  ),
                  title: Text(
                    (price/100).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
