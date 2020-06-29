import 'package:StudentApp/Models/Order.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final Order order;
  final Vendor vendor;

  const OrderPage({Key key, this.order, this.vendor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height * 0.3,
            child: Image.network(
              vendor.stallImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            child: Text("Order Number: " + order.orderID.toString()),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
