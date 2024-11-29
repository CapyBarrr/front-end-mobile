import 'package:flutter/material.dart';
import 'profile_widgets.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Inisialisasi dengan data profil yang ada
    _usernameController.text = "Marion Jola";
    _emailController.text = "bacang123@gmail.com";
    _phoneController.text = "08123456787655";
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My Profile"),
        actions: [
          TextButton(
            onPressed: () {
              // Logika untuk menyimpan data
              print("Data disimpan:");
              print("Username: ${_usernameController.text}");
              print("Email: ${_emailController.text}");
              print("Phone Number: ${_phoneController.text}");

              // Tambahkan logika untuk menyimpan ke database atau backend
            },
            child: const Text(
              "Simpan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan avatar
            Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.edit, size: 20),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            // Form untuk input data
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileTextField(
                    controller: _usernameController,
                    label: "Username",
                  ),
                  const SizedBox(height: 16),
                  ProfileTextField(
                    controller: _emailController,
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  ProfileTextField(
                    controller: _phoneController,
                    label: "Phone Number",
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
