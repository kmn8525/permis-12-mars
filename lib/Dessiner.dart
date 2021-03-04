

import 'package:flutter/material.dart';
// CustomPainter class to for the header curved-container
class DessinIncurveProfil extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color =   Colors.blueAccent;
    Path path = Path()
      ..relativeLineTo(0, 80)
      ..quadraticBezierTo(size.width / 2, 150.0, size.width, 80)
      ..relativeLineTo(0, -80)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;


}

class DessinBasBarNavigation extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Paint shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 0.5);

    Path path = Path();

    path.moveTo(0, 30); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.lineTo(0, 20);

    // canvas.drawShadow(path, Colors.black, 2.0, true);
    canvas.drawPath(path, paint);
    //canvas.drawShadow(path.shift(Offset(0, -1)), Colors.white, 1.0, true);
   // canvas.drawShadow(path, Colors.white, 0.3, true);
    //canvas.drawShadow(path, Colors.grey.withAlpha(50), 4.0, false);

   // canvas.drawColor(Color(0), BlendMode.clear);
    canvas.drawPath(path.shift(Offset(0, 0)), shadowPaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}



