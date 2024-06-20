import 'package:flutter/material.dart';
import 'package:perpusku/lainnya_page.dart';
import 'package:perpusku/home_page.dart';

class ProfilePage extends StatefulWidget {
  final String nama; // User's name
  final String email; // User's email address
  final String telepon; // User's phone number

  const ProfilePage({
    required this.nama,
    required this.email,
    required this.telepon,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50.0,
              backgroundImage: const AssetImage('assets/default_profile_picture.png'),
            ),

            // Nama
            ListTile(
              title: const Text('Nama'),
              subtitle: Text(widget.nama),
            ),

            // Email
            ListTile(
              title: const Text('Email'),
              subtitle: Text(widget.email),
            ),

            // Telepon
            ListTile(
              title: const Text('Telepon'),
              subtitle: Text(widget.telepon),
            ),
          ],
        ),
      ),
    );
  }
}
