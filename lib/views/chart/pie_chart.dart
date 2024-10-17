import 'dart:math';
import 'package:flutter/material.dart';

class FlowerPieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint petalPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey.shade200;

    // Define the angles to position the petals around the pentagon
    List<double> angles = [-90, -18, 54, 126, 198];

    // Draw each petal behind the pentagon
    for (double angle in angles) {
      drawLeafPetal(canvas, size, petalPaint, angle);
    }

    // drawLeafPetal(canvas, size, petalPaint, -90);
    // Draw the center pentagon on top of the petals
    drawCenterPentagon(canvas, size);

    // Draw icons in petals (with varying angles)
    for (double angle in angles) {
      _drawIconInPetalWithBackground(
          canvas, size, Icons.alarm, angle, Colors.orangeAccent.shade100);
    }

    // Draw the center text ("00")
    drawCenterText(canvas, size);
  }

  void drawCenterPentagon(Canvas canvas, Size size) {
    Paint pentagonPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.fill;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = 40; // Adjust the size of the pentagon

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

    // Paint for the white border
    Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    // Draw the pentagon's white border
    canvas.drawPath(pentagonPath, borderPaint);
    canvas.drawPath(pentagonPath, pentagonPaint);
  }

  void drawLeafPetal(Canvas canvas, Size size, Paint paint, double angle) {
    // Calculate the pentagon's outer tip coordinates to attach the petal
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double pentagonRadius = 40; // Same radius as the pentagon
    double petalOffset = 15; // Move petal start inward

    // Calculate the inward position of the petal to start drawing
    double startX =
        centerX + (pentagonRadius - petalOffset) * cos(degreeToRadians(angle));
    double startY =
        centerY + (pentagonRadius - petalOffset) * sin(degreeToRadians(angle));

    // Move canvas to the tip of the pentagon and rotate the petal
    canvas.save();
    canvas.translate(startX, startY);
    canvas.rotate(
        degreeToRadians(angle + 90)); // Rotate to align with the pentagon's tip

    // Draw the petal behind the pentagon
    Path path = Path();
    path.moveTo(0, 0); // Start from the adjusted position

    // Adjust control points for larger petals
    path.quadraticBezierTo(100, -80, 0, -150); // Right side curve of the petal
    path.quadraticBezierTo(-100, -80, 0, 0); // Left side curve of the petal
    path.close();

    // Paint for the white border
    Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    // Draw the petal's white border
    canvas.drawPath(path, borderPaint);

    // Draw the petal itself using the provided paint
    canvas.drawPath(path, paint);

    canvas.restore(); // Restore the canvas to avoid affecting other drawings
  }

  void drawCenterText(Canvas canvas, Size size) {
    // Center Text ("00")
    TextPainter textPainter = TextPainter(
      text: const TextSpan(
        text: '00',
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          // fontWeight: FontWeight.bold,
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
        size.width / 4.0; // Position the icon within each petal
    const double backgroundRadius = 20.0; // Radius for the background circle

    // Calculate icon position based on angle
    final x = size.width / 2 + radius * cos(degreeToRadians(angle));
    final y = size.height / 2 + radius * sin(degreeToRadians(angle));

    // Draw the circular background
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(x, y), backgroundRadius, backgroundPaint);

    // Draw the icon
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: icon.fontFamily,
          color: Colors.black, // Color for the icon
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
