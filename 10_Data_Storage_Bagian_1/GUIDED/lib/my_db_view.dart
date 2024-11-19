import 'package:flutter/material.dart';
import 'db_helper.dart';

class MyDbView extends StatefulWidget {
  @override
  _MyDbViewState createState() => _MyDbViewState();
}

class _MyDbViewState extends State<MyDbView> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final allRows = await dbHelper.queryAllRows();
    setState(() {
      data = allRows;
    });
  }

  void _insertData(String title, String description) async {
    await dbHelper.insert({'title': title, 'description': description});
    _fetchData();
  }

  void _updateData(int id, String title, String description) async {
    await dbHelper
        .update({'id': id, 'title': title, 'description': description});
    _fetchData();
  }

  void _deleteData(int id) async {
    await dbHelper.delete(id);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite CRUD Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text(data[index]['description']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _updateData(data[index]['id'], 'Updated Title',
                              'Updated Description');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteData(data[index]['id']);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _insertData('New Title', 'New Description');
              },
              child: Text('Add New Data'),
            ),
          ),
        ],
      ),
    );
  }
}
