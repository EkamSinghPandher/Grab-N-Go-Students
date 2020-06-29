import 'package:StudentApp/Models/Order.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/main_pages/History_Current_Screen/OrderPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatTile extends StatelessWidget {
  final Order order;

  ChatTile({this.order});

  @override
  Widget build(BuildContext context) {
    List<Vendor> vendors = Provider.of<List<Vendor>>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderPage(
                      order: order,
                      vendor: vendors.firstWhere(
                          (element) => element.uid == order.vendorUID),
                    )));
      },
      child: Column(
        children: <Widget>[
          Divider(),
          Row(
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
          Divider()
        ],
      ),
    );
  }
}
