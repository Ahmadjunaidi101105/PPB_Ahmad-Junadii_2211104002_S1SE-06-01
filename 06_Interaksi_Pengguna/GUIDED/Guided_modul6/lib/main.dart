import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Buat class untuk menyimpan user data
class UserData extends ChangeNotifier {
  String _name = '';
  String _email = '';

  String get name => _name;
  String get email => _email;

  void updateData(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners();
  }
}

void main() {
  final userData = UserData();
  runApp(MyApp(userData: userData));
}

class MyApp extends StatelessWidget {
  final UserData userData;

  const MyApp({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
        primarySwatch: Colors.yellow,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title:
                const Text('Aplikasi Pengguna', style: TextStyle(fontSize: 24)),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Form'),
                Tab(text: 'Menu'),
                Tab(text: 'Buttons'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FormExample(userData: userData),
              MyBottomNavBar(userData: userData),
              const ButtonExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  final UserData userData;

  const FormExample({super.key, required this.userData});

  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  void _submit() {
    final String name = _nameController.text;
    final String email = _emailController.text;

    if (!_isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email tidak valid'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    widget.userData.updateData(name, email);

    _nameController.clear();
    _emailController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 4, 92, 134),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nama',
              hintText: 'Masukkan Nama',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.person, color: Colors.blue),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Masukkan Email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.email, color: Colors.blue),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

class MyBottomNavBar extends StatefulWidget {
  final UserData userData;

  const MyBottomNavBar({super.key, required this.userData});

  @override
  State createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.userData,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_selectedIndex == 0) ...[
                    const Text(
                      'Data User:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Nama: ${widget.userData.name}'),
                    Text('Email: ${widget.userData.email}'),
                  ] else if (_selectedIndex == 1) ...[
                    const Text(
                      'Ini adalah Menu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else ...[
                    const Text(
                      'Ini adalah History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}

class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ini adalah Elevated Button')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Elevated Button'),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ini adalah Text Button')),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Text Button'),
          ),
          const SizedBox(height: 16),
          DropdownButton<String>(
            value: _selectedOption,
            isExpanded: true,
            hint: const Text('Pilih Opsi'),
            items: ['Opsi 1', 'Opsi 2', 'Opsi 3'].map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
