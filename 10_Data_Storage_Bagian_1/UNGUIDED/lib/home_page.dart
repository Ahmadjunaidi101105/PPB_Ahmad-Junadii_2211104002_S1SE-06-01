import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'input_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _biodata = [];

  void _loadData() async {
    final data = await DatabaseHelper().queryAllRows();
    setState(() {
      _biodata = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Biodata Mahasiswa')),
      body: ListView.builder(
        itemCount: _biodata.length,
        itemBuilder: (context, index) {
          final item = _biodata[index];
          return ListTile(
            title: Text(item['nama']),
            subtitle: Text(
              'NIM: ${item['nim']}\nAlamat: ${item['alamat']}\nHobi: ${item['hobi']}',
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InputPage()),
          );
          _loadData(); // Muat ulang data setelah menambahkan
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
