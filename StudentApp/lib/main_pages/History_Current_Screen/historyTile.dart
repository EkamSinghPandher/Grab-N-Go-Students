import 'package:StudentApp/Models/Order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryTile extends StatelessWidget {
  final Order order;
  final double height;
  final double width;

  const HistoryTile({Key key, this.order, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: <Widget>[
          Container(
            height: height * 0.8,
            width: width * 0.9,
            child: Row(
              children: <Widget>[
                Container(
                  height: height * 0.60,
                  width: width * 0.28,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network(
                      order.orderImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 0, 2),
                  height: height * 0.6,
                  width: width * 0.38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Order: ${order.orderID}",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600)),
                      Text(
                        "x${order.quantity.toString()} ${order.foodName}",
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                          "Cost: \$${(order.foodPrice / 100).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400)),
                      Text(
                          "Time: ${DateFormat('HH:mm').format(order.dateTime)}",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 22,
            indent: 22,
            thickness: 0.7,
          )
        ],
      ),
    );
  }
}
