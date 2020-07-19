import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path circlePath = Path();
    //starting paint
    circlePath.moveTo(0, height * 0.2);
    //first ending point
    circlePath.quadraticBezierTo(
      width * 0.45,
      height * 0.25,
      width * 0.5,
      height * 0.5,
    );

    //second half of curve
    circlePath.quadraticBezierTo(
      width * 0.58,
      height * 0.8,
      width * 0.1,
      height,
    );

    //remaining shade
    circlePath.lineTo(0, height);
    circlePath.close();

    paint.color = Colors.blue.shade200;
    canvas.drawPath(circlePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
