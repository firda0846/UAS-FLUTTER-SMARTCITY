import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model for Book
class Book {
  final String judul;
  final String penulis;
  final double rating;
  final int halaman;
  final int stok;
  final String gambar;

  Book({
    required this.judul,
    required this.penulis,
    required this.rating,
    required this.halaman,
    required this.stok,
    required this.gambar,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      judul: json['judul'] ?? '',
      penulis: json['penulis'] ?? '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
      halaman: json['halaman'] ?? 0,
      stok: json['stok'] ?? 0,
      gambar: json['gambar'] ?? '',
    );
  }
}


// API Service
class ApiService {
  final String baseUrl = 'http://192.168.1.61:3000/users/edukasi';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwiaWF0IjoxNzE4ODg0OTkwLCJleHAiOjE3MTg4ODg1OTB9.5Bag8vcqd71s7TeMKJ8pyyMs4uZP10fvdbbeEu6Rscw';

  Future<List<Book>> getBooks() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = jsonDecode(response.body);
        if (responseJson['books'] != null) {
          List<dynamic> booksJson = responseJson['books'];
          List<Book> books = booksJson.map((json) => Book.fromJson(json)).toList();
          return books;
        } else {
          throw Exception('No books data found');
        }
      } else {
        throw Exception('Failed to load books: ${response.body}');
      }
    } catch (e) {
      print('Error fetching books: $e');
      throw Exception('Failed to load books: $e');
    }
  }
}

// Peminjaman Page
class PeminjamanPage extends StatefulWidget {
  final String judul;

  PeminjamanPage({required this.judul});

  @override
  _PeminjamanPageState createState() => _PeminjamanPageState();
}

class _PeminjamanPageState extends State<PeminjamanPage> {
  List<Book> books = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      ApiService apiService = ApiService();
      List<Book> fetchedBooks = await apiService.getBooks();
      setState(() {
        books = fetchedBooks;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch books: $e');
      setState(() {
        errorMessage = 'Failed to load books: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judul),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Buku yang Dipinjam',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return ListTile(
                              leading: Icon(Icons.book),
                              title: Text(book.judul),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Penulis: ${book.penulis}'),
                                  Text('Rating: ${book.rating}'),
                                  Text('Halaman: ${book.halaman}'),
                                  Text('Stok: ${book.stok}'),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}

class DetailBukuPage extends StatelessWidget {
  final String judul;
  final String penulis;
  final String gambar;
  final double rating;
  final int halaman;
  final int stok;

  DetailBukuPage({
    required this.judul,
    required this.penulis,
    required this.gambar,
    required this.rating,
    required this.halaman,
    required this.stok,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                gambar,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                judul,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'oleh $penulis',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  '$rating/5',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  'Halaman: $halaman',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  'Stok: $stok',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: stok > 0 ? () {
                  // Logika untuk meminjam buku
                  // Misalnya, navigasi ke halaman peminjaman
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PeminjamanPage(judul: judul)),
                  );
                } : null, // Disable button if stock is 0
                child: Text('Pinjam Buku'),
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Deskripsi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Deskripsi buku akan ditampilkan di sini. Deskripsi ini menjelaskan isi dan informasi terkait buku.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Tambahan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Jumlah halaman, kategori, tahun terbit, dan lain-lain akan ditampilkan di sini.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DetailBukuPage(
      judul: 'Contoh Buku',
      penulis: 'Penulis Buku',
      gambar: './images/buku1.jpg',
      rating: 4.5,
      halaman: 200,
      stok: 5,
    ),
  ));
}
