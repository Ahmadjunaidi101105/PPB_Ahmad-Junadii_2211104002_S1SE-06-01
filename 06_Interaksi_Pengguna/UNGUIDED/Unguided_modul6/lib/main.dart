import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Pages to display when the BottomNavigationBar is tapped
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Initialize _pages
    _pages = [
      // Home Page (Beranda)
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), // Space between input fields
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Masukkan Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), // Space before the button
            ElevatedButton(
              onPressed: () {
                // Handle submit action here
                print(
                    "Nama: ${_nameController.text}, Email: ${_emailController.text}");
              },
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange, // Button color to match the image
              ),
            ),
          ],
        ),
      ),
      // Tourism Page (Wisata)
      const Center(
          child: Text('Ini Halaman Wisata', style: TextStyle(fontSize: 24))),
      // Profile Page
      const Center(
          child: Text('Ini Halaman Profile', style: TextStyle(fontSize: 24))),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan BottomNavigationBar'),
          backgroundColor: Colors.orange,
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Wisata',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
