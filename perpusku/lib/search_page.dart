import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pencarian'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Cari',
                hintText: 'Masukkan kata kunci',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child:
                _buildSearchResults(), // Method untuk menampilkan hasil pencarian
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    // Implementasi untuk menampilkan hasil pencarian sesuai dengan _searchText
    // Misalnya, daftar koleksi buku yang sesuai dengan kata kunci pencarian
    return ListView(
      children: [
        ListTile(
          title: Text('Buku 1'),
          subtitle: Text('Penulis 1'),
          onTap: () {
            // Navigasi ke detail buku atau aksi lainnya sesuai kebutuhan
          },
        ),
        ListTile(
          title: Text('Buku 2'),
          subtitle: Text('Penulis 2'),
          onTap: () {
            // Navigasi ke detail buku atau aksi lainnya sesuai kebutuhan
          },
        ),
        // Tambahkan lebih banyak daftar buku sesuai dengan hasil pencarian
      ],
    );
  }
}