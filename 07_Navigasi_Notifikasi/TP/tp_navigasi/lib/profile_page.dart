// lib/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], // Deep navy blue background
      appBar: AppBar(
        title: const Text("Profile - CV"),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'foto_profile.png'), // Reference the image directly
              ),
              const SizedBox(height: 20),
              const Text(
                "Ahmad Junaidi",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Flutter Developer",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Experienced developer with a background in mobile applications and a passion for crafting visually appealing and user-friendly apps.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Divider(height: 30, color: Colors.tealAccent),
              _buildSectionTitle("Education"),
              _buildEducationItem(
                institution: "Telkom University Purwokerto",
                degree: "Current Student",
                period: "2022 - Present",
              ),
              const Divider(height: 30, color: Colors.tealAccent),
              _buildSectionTitle("Work Experience"),
              _buildExperienceItem(
                company: "Innovilage",
                position: "Intern",
                period: "2023",
                description:
                    "Gained hands-on experience in software development and project management.",
              ),
              _buildExperienceItem(
                company: "P2MW",
                position: "Intern",
                period: "2023",
                description:
                    "Collaborated on various projects focusing on mobile application development.",
              ),
              const Divider(height: 30, color: Colors.tealAccent),
              _buildSectionTitle("Skills"),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  _buildSkillChip("Flutter"),
                  _buildSkillChip("Dart"),
                  _buildSkillChip("JavaScript"),
                  _buildSkillChip("UI/UX Design"),
                  _buildSkillChip("Project Management"),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  shadowColor: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    const Text("Back to Home", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.tealAccent,
        ),
      ),
    );
  }

  Widget _buildEducationItem({
    required String institution,
    required String degree,
    required String period,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school, color: Colors.tealAccent, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  institution,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  degree,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  period,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String company,
    required String position,
    required String period,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.business, color: Colors.tealAccent, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  position,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  period,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.tealAccent,
      padding: const EdgeInsets.all(8),
    );
  }
}
