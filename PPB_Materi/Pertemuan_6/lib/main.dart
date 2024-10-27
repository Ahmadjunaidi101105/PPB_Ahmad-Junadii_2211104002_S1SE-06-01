import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Interaction',
      theme: ThemeData(
          // Customize the theme here (optional)
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define your list of items with name and detail
  final List<Map<String, String>> items = [
    {
      'name': 'Native App',
      'detail': 'Hybrid App: Android, iOS, Web\n\n JavaScript, Dart'
    },
    {
      'name': 'Hybrid App',
      'detail': 'Hybrid App: Android, iOS, Web\n\n JavaScript, Dart'
    },
    // Add more items here
  ];

  void showItemDetail(BuildContext context, String detail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail'),
          content: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black), // Default text color
              children: <TextSpan>[
                TextSpan(
                  text: 'Hybrid App: ',
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight:
                          FontWeight.bold, // Blue color for "Hybrid App"
                      fontSize: 18), // Increase font size
                ),
                TextSpan(
                    text: detail,
                    style: const TextStyle(fontSize: 16)), // Increase font size
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ListView with Dialog'),
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) =>
            const Divider(), // Add a separator
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50, // Set the width of the CircleAvatar
              height: 50, // Set the height of the CircleAvatar
              child: CircleAvatar(
                backgroundColor: index == 0
                    ? Colors.orange
                    : Colors.grey, // Orange for Native App, Grey for Hybrid App
              ),
            ),
            title: Text(
              items[index]['name']!,
              style: const TextStyle(fontSize: 20), // Increase font size
            ),
            onTap: () {
              showItemDetail(context, items[index]['detail']!);
            },
          );
        },
      ),
    );
  }
}
