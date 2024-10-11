import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listContainer = [
      Container(
        height: 100,
        color: Colors.amber[600],
        child: const Center(child: Text('Entry A')),
      ),
      Container(
        height: 200,
        color: Colors.amber[500],
        child: const Center(child: Text('Entry B')),
      ),
      Container(
        height: 300,
        color: Colors.amber[100],
        child: const Center(child: Text('Entry C')),
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan List View'),
          backgroundColor: Colors.amberAccent,
        ),
        body:
            ListView(padding: const EdgeInsets.all(8), children: listContainer),
      ),
    );
  }
}
