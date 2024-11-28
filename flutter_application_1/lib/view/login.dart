import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Glamping',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  // Tambahkan style font yang Anda inginkan di sini
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika ketika tombol "Login" ditekan
                  // Misalnya, navigasi ke halaman home
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // Tambahkan logika ketika tombol "Create account?" ditekan
                  // Misalnya, navigasi ke halaman registrasi
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Create account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}