import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/purchase_food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Food extends StatelessWidget {
  final String name;

  const Food({this.name});

  @override
  Widget build(BuildContext context) {
    var foodList = Provider.of<List<Vendor>>(context)
        .where((element) => element.stallName == name)
        .toList()
        .first
        .menu
        .map((e) =>
            {'name': e.foodName, 'picture': e.foodImage, 'price': e.foodPrice})
        .toList();
    return GridView.builder(
      itemCount: foodList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleFood(
          name: foodList[index]['name'],
          picture: foodList[index]['picture'],
          price: foodList[index]['price'],
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
                    price,
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
