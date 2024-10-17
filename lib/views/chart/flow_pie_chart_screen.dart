import 'package:destion_assesment_osman/views/chart/pie_chart.dart';
import 'package:flutter/material.dart';

class FlowerPieChartScreen extends StatefulWidget {
  const FlowerPieChartScreen({super.key});

  @override
  State<FlowerPieChartScreen> createState() => _FlowerPieChartScreenState();
}

class _FlowerPieChartScreenState extends State<FlowerPieChartScreen> {
  int? index;
  Map<String, String> wellnesses = {
    "physical":
        "includes activities like walking, stretching, or light exercises to boost your mobility and strength.",
    "mental":
        "involves puzzles, learning tasks, or reflective activities to stimulate cognitive health and mental agility.",
    "emotional":
        "involves puzzles, learning tasks, or reflective activities to stimulate cognitive health and mental agility.",
    "social":
        "involves puzzles, learning tasks, or reflective activities to stimulate cognitive health and mental agility.",
    "spirtual":
        "involves puzzles, learning tasks, or reflective activities to stimulate cognitive health and mental agility.",
  };
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
              index == null
                  ? CustomPaint(
                      size: const Size(400, 400),
                      painter: FlowerPieChartPainter(),
                    )
                  : CustomPaint(
                      size: const Size(400, 400),
                      painter: FlowerPieChartPainter(index: index),
                    ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  '* Click on each petal to learn more.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index != null
                        ? RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                  text:
                                      'The ${wellnesses.keys.elementAt(index!)} dimension ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      '${wellnesses[wellnesses.keys.elementAt(index!)]}',
                                ),
                              ],
                            ),
                          )
                        : const Text(
                            "Tailor you first daily challenge by selecting favorite missions from the five wellness dimensions.",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                    const SizedBox(height: 40),
                    const Text(
                      "Click 'Go' to start",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tailor your first daily challenge',
                        style: TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() {
                          if (index == null) {
                            index = 0;
                          } else if (index! <= 3) {
                            index = index! + 1;
                          } else {
                            index = null;
                          }
                        }),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Go',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
