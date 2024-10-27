// lib/settings_page.dart
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> _educations = [];
  final List<String> _experiences = [];
  final List<String> _skills = [];
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();

  @override
  void dispose() {
    _educationController.dispose();
    _experienceController.dispose();
    _skillController.dispose();
    super.dispose();
  }

  void _addEducation() {
    if (_educationController.text.isNotEmpty) {
      setState(() {
        _educations.add(_educationController.text);
        _educationController.clear();
      });
    }
  }

  void _addExperience() {
    if (_experienceController.text.isNotEmpty) {
      setState(() {
        _experiences.add(_experienceController.text);
        _experienceController.clear();
      });
    }
  }

  void _addSkill() {
    if (_skillController.text.isNotEmpty) {
      setState(() {
        _skills.add(_skillController.text);
        _skillController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800], // Bright teal background
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.teal[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Manage Your Profile",
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Bagian Pendidikan
            const Text("Education", style: TextStyle(color: Colors.white)),
            TextField(
              controller: _educationController,
              decoration: const InputDecoration(
                hintText: "Enter education",
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            ElevatedButton(
              onPressed: _addEducation,
              child: const Text("Add Education"),
            ),
            ..._educations
                .map((edu) => ListTile(
                    title:
                        Text(edu, style: const TextStyle(color: Colors.white))))
                .toList(),
            const Divider(height: 30, color: Colors.tealAccent),

            // Bagian Pengalaman Kerja
            const Text("Experience", style: TextStyle(color: Colors.white)),
            TextField(
              controller: _experienceController,
              decoration: const InputDecoration(
                hintText: "Enter experience",
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            ElevatedButton(
              onPressed: _addExperience,
              child: const Text("Add Experience"),
            ),
            ..._experiences
                .map((exp) => ListTile(
                    title:
                        Text(exp, style: const TextStyle(color: Colors.white))))
                .toList(),
            const Divider(height: 30, color: Colors.tealAccent),

            // Bagian Keahlian
            const Text("Skills", style: TextStyle(color: Colors.white)),
            TextField(
              controller: _skillController,
              decoration: const InputDecoration(
                hintText: "Enter skill",
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            ElevatedButton(
              onPressed: _addSkill,
              child: const Text("Add Skill"),
            ),
            ..._skills
                .map((skill) => ListTile(
                    title: Text(skill,
                        style: const TextStyle(color: Colors.white))))
                .toList(),
          ],
        ),
      ),
    );
  }
}
