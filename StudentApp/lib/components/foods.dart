import 'package:StudentApp/main_pages/Shops_Screen/subpages/purchase_food_page.dart';
import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  var foodList = [
    {
      "name": "Set 1",
      "picture": "images/chicken/CRset1.png",
      "price": "\$6.00"
    },
    {
      "name": "Set 2",
      "picture": "images/chicken/CRset2.png",
      "price": "\$6.50"
    },
    {
      "name": "Set 3",
      "picture": "images/chicken/CRset3.png",
      "price": "\$5.50"
    },
  ];
  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
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
