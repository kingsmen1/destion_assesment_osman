import 'dart:math';
import 'package:flutter/material.dart';

class FlowerPieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint petalPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey.shade200;

    List<double> angles = [-90, -18, 54, 126, 198];

    for (double angle in angles) {
      drawLeafPetal(canvas, size, petalPaint, angle);
    }
    
    drawCenterPentagon(canvas, size);

    for (double angle in angles) {
      _drawIconInPetalWithBackground(
          canvas, size, Icons.alarm, angle, Colors.grey.shade300);
    }

    _drawIconInPetalWithBackground(
        canvas, size, Icons.alarm, 198, Colors.orange);

    
    drawCenterText(canvas, size);
  }

  void drawCenterPentagon(Canvas canvas, Size size) {
    Paint pentagonPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.fill;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = 40; 

    Path pentagonPath = Path();
    for (int i = 0; i < 5; i++) {
      double angle = (72 * i - 90) * pi / 180;
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);
      if (i == 0) {
        pentagonPath.moveTo(x, y);
      } else {
        pentagonPath.lineTo(x, y);
      }
    }
    pentagonPath.close();

    Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawPath(pentagonPath, borderPaint);
    canvas.drawPath(pentagonPath, pentagonPaint);
  }

  void drawLeafPetal(Canvas canvas, Size size, Paint paint, double angle) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double pentagonRadius = 40; 
    double petalOffset = 15; 

    double startX =
        centerX + (pentagonRadius - petalOffset) * cos(degreeToRadians(angle));
    double startY =
        centerY + (pentagonRadius - petalOffset) * sin(degreeToRadians(angle));

    canvas.save();
    canvas.translate(startX, startY);
    canvas.rotate(
        degreeToRadians(angle + 90)); 

    Path path = Path();
    path.moveTo(0, 0); 

    path.quadraticBezierTo(100, -80, 0, -150); 
    path.quadraticBezierTo(-100, -80, 0, 0); 
    path.close();

    Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawPath(path, borderPaint);

    canvas.drawPath(path, paint);

    Path rightHalfPath = Path();
    rightHalfPath.moveTo(0, 0);
    rightHalfPath.quadraticBezierTo(100, -80, 0, -150); 
    rightHalfPath.quadraticBezierTo(0, 0, 0, 0); 
    rightHalfPath.lineTo(0, 0); 
    rightHalfPath.close();

    Paint rightHalfPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

   
    canvas.drawPath(rightHalfPath, rightHalfPaint);

   
    canvas.restore();
  }

  void drawCenterText(Canvas canvas, Size size) {
    
    TextPainter textPainter = TextPainter(
      text: const TextSpan(
        text: '00',
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width / 2 - textPainter.width / 2,
            size.height / 2 - textPainter.height / 2));
  }

  void _drawIconInPetalWithBackground(Canvas canvas, Size size, IconData icon,
      double angle, Color backgroundColor) {
    const iconSize = 20.0;
    final double radius =
        size.width / 4.0; 
    const double backgroundRadius = 20.0; 

    
    final x = size.width / 2 + radius * cos(degreeToRadians(angle));
    final y = size.height / 2 + radius * sin(degreeToRadians(angle));

    
    Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    canvas.drawCircle(Offset(x, y), 18, borderPaint);

    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(x, y), backgroundRadius, backgroundPaint);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: icon.fontFamily,
          color: Colors.black, 
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(x - iconSize / 2, y - iconSize / 2));
  }

  double degreeToRadians(double degree) {
    return degree * pi / 180;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
