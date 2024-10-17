import 'package:destion_assesment_osman/views/chart/pie_chart.dart';
import 'package:flutter/material.dart';

class FlowerPieChartScreen extends StatelessWidget {
  const FlowerPieChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_outline_outlined),
        ),
      ]),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(188, 212, 198, 1),
                Color.fromRGBO(93, 177, 176, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5 dimensions of",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      "wellness",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
              CustomPaint(
                size: const Size(400, 400),
                painter: FlowerPieChartPainter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
