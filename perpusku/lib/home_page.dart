import 'package:flutter/material.dart';
import 'home_page_content.dart';
import 'search_page.dart';
import 'peminjaman_page.dart';
import 'koleksi_page.dart';
import 'lainnya_page.dart';
import 'detail_buku_page.dart';
import 'pengembalian_page.dart';
import 'notifications_page.dart'; // Import NotificationsPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    KoleksiPage(),
    NotificationsPage(), // Add NotificationsPage to the list
    LainnyaPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              './images/logo.png', // Path to your logo image
              height: 30, // Adjust the height as needed
            ),
            SizedBox(width: 10), // Add some space between the logo and text
            Text(
              'Perpusku',
              style: TextStyle(
                fontFamily:
                    'montserrat', // Replace 'YourFont' with your font family
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.black, // Set color for selected item
        unselectedItemColor: Colors.black, // Set color for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Koleksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi', // Add label for notifications
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Lainnya',
          ),
        ],
      ),
    );
  }
}
