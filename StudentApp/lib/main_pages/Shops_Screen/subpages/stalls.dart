import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/main_pages/Shops_Screen/subpages/singleStall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stalls extends StatelessWidget {
  final Student student;

  const Stalls({Key key, @required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Vendor> vendorList = Provider.of<List<Vendor>>(
      context,
    );
    List<Vendor> stallList = vendorList == null ? [] : vendorList;
    return GridView.builder(
      itemCount: stallList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleStall(
          student: student,
          shop: stallList[index],
        );
      },
    );
  }
}
