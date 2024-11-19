import 'package:flutter/material.dart';
import 'db_helper.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _alamatController = TextEditingController();
  final _hobiController = TextEditingController();

  void _saveData() async {
    if (_formKey.currentState!.validate()) {
      final dbHelper = DatabaseHelper();
      await dbHelper.insert({
        'nama': _namaController.text,
        'nim': _nimController.text,
        'alamat': _alamatController.text,
        'hobi': _hobiController.text,
      });
      Navigator.pop(context); // Kembali ke halaman utama
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Biodata Mahasiswa')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: _nimController,
                decoration: InputDecoration(labelText: 'NIM'),
                validator: (value) =>
                    value!.isEmpty ? 'NIM tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: _hobiController,
                decoration: InputDecoration(labelText: 'Hobi'),
                validator: (value) =>
                    value!.isEmpty ? 'Hobi tidak boleh kosong' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveData,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
