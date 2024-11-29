import 'package:flutter/material.dart';
import './edit_profile.dart';  // Pastikan mengimpor file EditProfilePage yang sudah Anda buat

class ProfilePage extends StatelessWidget {
  final VoidCallback onLogout; // Properti onLogout wajib diinisialisasi

  const ProfilePage({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.green, // Warna hijau header
      ),
      body: Column(
        children: [
          // Header dengan avatar dan informasi profil
          Container(
            color: Colors.green, // Background hijau header
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.edit, size: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Marion Jola',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'bacang123@gmail.com',
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman Edit Profile
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // List menu pengaturan
          Expanded(
            child: ListView(
              children: [
                SettingTile(
                  icon: Icons.lock,
                  title: 'Forgot Password',
                ),
                SettingTile(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                ),
                SettingTile(
                  icon: Icons.privacy_tip,
                  title: 'Privacy',
                ),
              ],
            ),
          ),
          // Tombol Logout
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // Warna tombol
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onLogout, // Memanggil fungsi logout
              child: Center(
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk item pengaturan
class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Tambahkan aksi tap di sini
      },
    );
  }
}
