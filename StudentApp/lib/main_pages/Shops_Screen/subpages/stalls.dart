import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stalls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Vendor> vendorList = Provider.of<List<Vendor>>(context, listen: false);
    var stallList = vendorList == null ? [] :vendorList.map((e) => {'name': e.stallName, 'picture': e.stallImage}).toList();
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
