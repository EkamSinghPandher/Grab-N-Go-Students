import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:StudentApp/main_pages/Shops_Screen/shops_background.dart';
import 'package:provider/provider.dart';

import 'stalls.dart';
import 'package:flutter/material.dart';

class StallPage extends StatelessWidget {
  final String location;

  final Student student;

  const StallPage({@required this.location, @required this.student});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Vendor>>(
      create: (_) => DataService().vendorsFromLocation(location),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            location,
            style: TextStyle(
              color: Colors.blue.shade800,
              fontFamily: "Montserrat",
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: CustomPaint(
          painter: ShopBackground(),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 550,
                  child: Stalls(student: student),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
