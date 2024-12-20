import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flexible & Expanded Example'),
        ),
        body: Column(
          children: [
            // Flexible example
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 100,
                  color: Colors.red,
                ),
                Flexible(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: const Text(
                      "Flexible takes up the remaining space but can shrink if needed.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Icon(Icons.sentiment_very_satisfied),
              ],
            ),
            const SizedBox(height: 20),

            // Expanded example
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 100,
                  color: Colors.red,
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: const Text(
                      "Expanded forces the widget to take up all the remaining space.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Icon(Icons.sentiment_very_satisfied),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
