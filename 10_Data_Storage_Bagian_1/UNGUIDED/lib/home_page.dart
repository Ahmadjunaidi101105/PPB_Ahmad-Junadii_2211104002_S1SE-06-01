import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'input_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _biodata = [];

  // Fungsi untuk memuat data dari database
  void _loadData() async {
    final data = await DatabaseHelper().queryAllRows();
    print('Data yang dimuat: $data'); // Debug log
    setState(() {
      _biodata = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData(); // Memuat data ketika halaman pertama kali dibuka
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('SQLite Biodata Mahasiswa',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _biodata.isEmpty
          ? Center(
              child: Text('Tidak ada data mahasiswa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
          : ListView.builder(
              itemCount: _biodata.length,
              itemBuilder: (context, index) {
                final item = _biodata[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text(item['nama'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NIM: ${item['nim']}',
                            style: TextStyle(fontSize: 14)),
                        Text('Alamat: ${item['alamat']}',
                            style: TextStyle(fontSize: 14)),
                        Text('Hobi: ${item['hobi']}',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
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
          _loadData(); // Memuat ulang data setelah menambah data
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
