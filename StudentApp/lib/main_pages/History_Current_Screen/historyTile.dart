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
    return Card(
      color: Colors.blueGrey,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: 85,
            height: 80,
            padding: EdgeInsets.all(3),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(vendors
                    .firstWhere((element) => element.uid == order.vendorUID)
                    .stallImage)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(vendors
                  .firstWhere((element) => element.uid == order.vendorUID)
                  .stallName),
              Text(DateFormat("dd-MM-yyyy HH:mm").format(order.dateTime)),
            ],
          ),
        ],
      ),
    );
  }
}
