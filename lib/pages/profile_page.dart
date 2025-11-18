import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Foto Profil
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/images/profile.PNG'), // bisa diganti
            ),

            const SizedBox(height: 15),

            const Text(
              'Kamila&Fitri',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'UTS Pemograman Mobile 2',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            // Card Info
            _profileMenu(
              icon: Icons.person,
              title: 'Edit Profile',
            ),
            _profileMenu(
              icon: Icons.lock,
              title: 'Ganti Password',
            ),
            _profileMenu(
              icon: Icons.history,
              title: 'Riwayat Pembelian',
            ),
            _profileMenu(
              icon: Icons.settings,
              title: 'Pengaturan',
            ),
            _profileMenu(
              icon: Icons.help_outline,
              title: 'Bantuan',
            ),
            _profileMenu(
              icon: Icons.logout,
              title: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _profileMenu({required IconData icon, required String title}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon, size: 24, color: Colors.blueAccent),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    ),
  );
}