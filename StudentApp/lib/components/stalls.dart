import 'package:StudentApp/main_pages/Shops_Screen/subpages/food_page.dart';
import 'package:flutter/material.dart';

class Stalls extends StatefulWidget {
  @override
  _StallsState createState() => _StallsState();
}

class _StallsState extends State<Stalls> {
  var stallList = [
    {
      "name": "Chicken Rice",
      "picture": "images/chickenRice.png",
    },
    {
      "name": "Muslim",
      "picture": "images/muslim.png",
    },
    {
      "name": "Noodles",
      "picture": "images/noodle.png",
    },
    {
      "name": "Xiao Long Bao",
      "picture": "images/XLB.png",
    },
    {
      "name": "Drinks",
      "picture": "images/drink.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: stallList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleStall(
          name: stallList[index]['name'],
          picture: stallList[index]['picture'],
        );
      },
    );
  }
}

class SingleStall extends StatelessWidget {
  final name;
  final picture;

  SingleStall({this.name, this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) => new FoodPage(
                  shopName: name,
                  shopPicture: picture,
                ),
              ),
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    name,
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
