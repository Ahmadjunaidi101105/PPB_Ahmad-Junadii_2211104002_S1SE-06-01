import 'package:flutter/material.dart';
import 'my_db_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'SQLite CRUD Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDbView(), // Menampilkan halaman utama (MyDbView)
    );
  }
}
