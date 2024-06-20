import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart'; // Asumsikan Anda memiliki HomePage untuk pengguna yang sudah login
import 'peminjaman_page.dart';
import 'pengembalian_page.dart';
import 'lainnya_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CheckAuth(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/peminjaman': (context) => PeminjamanPage(judul: 'Judul Buku'),
        '/pengembalian': (context) => PengembalianPage(),
        '/lainnya': (context) => LainnyaPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class CheckAuth extends StatelessWidget {
  Future<bool> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data == true) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
