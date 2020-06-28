import 'package:StudentApp/Models/Order.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryTile extends StatelessWidget {
  final Order order;

  HistoryTile({this.order});

  @override
  Widget build(BuildContext context) {
    List<Vendor> vendors = Provider.of<List<Vendor>>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(vendors.firstWhere((element) => element.uid == order.vendorUID).stallName),
              Text(DateFormat("dd-MM-yyyy HH:mm").format(order.dateTime)),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "Details",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
