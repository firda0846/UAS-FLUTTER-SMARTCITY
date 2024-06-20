import 'package:flutter/material.dart';
import 'peminjaman_page.dart';
import 'pengembalian_page.dart';
import 'package:perpusku/edit_profile_page.dart'; // Import EditProfilePage
import 'package:perpusku/api_service.dart'; // Import ApiService
import 'package:shared_preferences/shared_preferences.dart';


class LainnyaPage extends StatefulWidget {
  @override
  _LainnyaPageState createState() => _LainnyaPageState();
}

class ApiService {
  // Constructor
  ApiService();

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    print('Token removed, user logged out.');
  }

  // Other methods...
}

class _LainnyaPageState extends State<LainnyaPage> {
  String _selectedLanguage = 'English'; // Default language
  bool _isDarkMode = false;
  final ApiService apiService = ApiService(); // Directly instantiate ApiService

  void _changeLanguage(String? language) {
    setState(() {
      _selectedLanguage = language ?? 'English';
    });
    // Here, you can add code to change the app's language
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Iya'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _logout(context); // Perform logout
              },
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    try {
      await apiService.logout();
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      // Push to login page and remove all routes from stack
    } catch (e) {
      print('Failed to logout: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to logout. Please try again.')),
      );
    }
  }

  void _editProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lainnya'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Peminjaman'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PeminjamanPage(judul: 'Judul Buku')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Pengembalian'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PengembalianPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Edit Profil'),
            onTap: () => _editProfile(context),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: _changeLanguage,
              items: <String>['English', 'Bahasa Indonesia']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Keluar'),
            onTap: () => _confirmLogout(context),
          ),
        ],
      ),
    );
  }
}
