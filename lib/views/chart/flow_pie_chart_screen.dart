import 'package:destion_assesment_osman/views/chart/pie_chart.dart';
import 'package:flutter/material.dart';

class FlowerPieChartScreen extends StatelessWidget {
  const FlowerPieChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: FlowerPieChartPainter(),
        ),
      ),
    );
  }
}