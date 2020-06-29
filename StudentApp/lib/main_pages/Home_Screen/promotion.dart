import 'package:flutter/material.dart';

class Promotion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 166,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images/food2.png"),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF961F).withOpacity(0.4),
              Colors.orangeAccent.withOpacity(0.5),
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text:
                    TextSpan(style: TextStyle(color: Colors.white), children: [
                  TextSpan(
                    text: "Wanton Mee\n",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Science Canteen",
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: RichText(
                text:
                    TextSpan(style: TextStyle(color: Colors.white), children: [
                  TextSpan(
                    text: "Discount of\n",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: "20%",
                    style: TextStyle(fontSize: 30),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
