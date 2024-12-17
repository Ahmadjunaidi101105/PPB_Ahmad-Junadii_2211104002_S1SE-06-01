import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _posts = [];
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  // Fungsi untuk menampilkan SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Fungsi untuk menangani operasi API
  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() => _isLoading = true);
    try {
      await operation;
      setState(() => _posts = _apiService.posts);
      _showSnackBar(successMessage);
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget _buildButton(String label, Color color, Function onPressed) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCard(String title, String body) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              body,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HTTP Request Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('GET', Colors.orange, () {
                  _handleApiOperation(
                      _apiService.fetchPosts(), 'Data berhasil diambil!');
                }),
                _buildButton('POST', Colors.green, () {
                  _handleApiOperation(
                      _apiService.createPost(), 'Data berhasil ditambahkan!');
                }),
                _buildButton('UPDATE', Colors.blue, () {
                  _handleApiOperation(
                      _apiService.updatePost(), 'Data berhasil diperbarui!');
                }),
                _buildButton('DELETE', Colors.red, () {
                  _handleApiOperation(
                      _apiService.deletePost(), 'Data berhasil dihapus!');
                }),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(color: Colors.grey),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _posts.isEmpty
                    ? Center(
                        child: Text(
                          "Tekan tombol GET untuk mengambil data",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _posts.length,
                        itemBuilder: (context, index) => _buildCard(
                          _posts[index]['title'],
                          _posts[index]['body'],
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
