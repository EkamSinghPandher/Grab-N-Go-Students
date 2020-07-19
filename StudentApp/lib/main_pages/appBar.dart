import 'package:flutter/material.dart';

AppBar topBar(BuildContext context, IconButton button, String title) {
  return AppBar(
    elevation: 0.0,
    title: Transform(
      transform: Matrix4.translationValues(-110.0, 0.0, 0.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blue.shade800,
          fontFamily: 'Montserrat',
          fontSize: 28.0,
        ),
      ),
    ),
    actions: <Widget>[
      button == null
          ? IconButton(icon: Icon(Icons.search), onPressed: () {})
          : button,
    ],
    backgroundColor: Colors.white,
  );
}
