import 'package:StudentApp/Models/Order.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/User.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:StudentApp/main_pages/Home_Screen/home_screen.dart';
import 'package:StudentApp/main_pages/Profile_Screen/profile_screen.dart';
import 'package:StudentApp/main_pages/Shops_Screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'History_Current_Screen/current_screen.dart';

class PageLogic extends StatefulWidget {
  static const String id = 'page_logic';
  @override
  _PageLogicState createState() => _PageLogicState();
}

class _PageLogicState extends State<PageLogic> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ShopScreen(),
    CurrentScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamProvider<Student>(
      create: (_) => DataService(uid: user.uid).students,
      child: StreamProvider<List<Order>>(
        create: (_) => DataService(uid: user.uid).myOrders,
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text('Shops'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.speaker_notes),
                title: Text('Orders'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
