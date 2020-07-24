import 'dart:math';

import 'package:StudentApp/Models/Vendor.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousell extends StatelessWidget {
  List<Vendor> shuffle(List<Vendor> items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    List<Vendor> vendors = Provider.of<List<Vendor>>(context);
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 180.0,
          width: 290,
          child: vendors == null
              ? CircularProgressIndicator()
              : new Carousel(
                  boxFit: BoxFit.cover,
                  images: shuffle(vendors)
                      .take(8)
                      .toList()
                      .map((e) => Image.network(
                            e.stallImage,
                            fit: BoxFit.fill,
                          ))
                      .toList(),
                  autoplay: false,
                  dotSize: 4.0,
                  indicatorBgPadding: 8.0,
                ),
        ),
      ),
    );
  }
}
