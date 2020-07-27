import 'dart:async';
import 'dart:io';

import 'package:StudentApp/main_pages/Home_Screen/home_background.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';

import 'carousell.dart';
import 'horizontal_listView.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  final Firestore db = Firestore.instance;
  final FirebaseMessaging fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      iosSubscription = fcm.onIosSettingsRegistered.listen((event) {});
      fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    fcm.configure(
      // ignore: missing_return
      onMessage: (Map<String, dynamic> message) {
        print("onMessage: $message");

        final snackbar = SnackBar(
          content: Text(message['notification']['title']),
          action: SnackBarAction(
            onPressed: () {},
            label: 'Go',
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      // ignore: missing_return
      onLaunch: (Map<String, dynamic> message) {
        print("onLaunch: $message");
      },
    );
  }

  saveDeviceToken(String uid) async {
    if (uid != null) {
      String fcmToken = await fcm.getToken();
      if (fcmToken != null) {
        var tokenref = db
            .collection('Students')
            .document(uid)
            .collection('Tokens')
            .document(fcmToken);

        await tokenref.setData({
          'token': fcmToken,
          'createdAt': FieldValue.serverTimestamp(),
          'platform': Platform.operatingSystem
        });
      }
    }
  }

  Widget build(BuildContext context) {
    Student stud = Provider.of<Student>(context);
    saveDeviceToken(Provider.of<Student>(context).uid);
    return stud == null
        ? CircularProgressIndicator()
        : Scaffold(
            body: CustomPaint(
              painter: HomeBackground(),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Discover",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Carousell(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: Colors.blue.shade800,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Places near you',
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HorizontalList(
                      studentID: stud.uid,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
