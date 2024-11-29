import 'package:flutter/material.dart';
import './view/home.dart';
import './view/profile.dart';
import './view/login.dart'; // Tambahkan import halaman login

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late final List<Widget> _pages; // Menggunakan late untuk memastikan inisialisasi

  @override
  void initState() {
    super.initState();
    // Inisialisasi halaman dengan callback logout yang valid
    _pages = [
      HomePage(),
      ProfilePage(
        onLogout: () {
          // Navigasi ke halaman login saat logout ditekan
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman sesuai index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Menunjukkan tab yang aktif
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengubah index sesuai dengan tab yang dipilih
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
