import 'package:flutter/material.dart';
import 'detail_buku_page.dart';

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'PERPUSKU',
            style: TextStyle(
              fontSize: 20, // Atur ukuran font
              color: Colors.white, // Ganti dengan warna teks yang diinginkan
              fontWeight: FontWeight.bold, // Gaya font
            ),
          ),
        ),
        centerTitle: true, // Memastikan teks berada di tengah
        backgroundColor:
            Color.fromARGB(255, 29, 147, 243), // Warna latar belakang AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Selamat Datang di PerpusKu!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Warna teks di bagian ini
                ),
                textAlign: TextAlign.center, // Pusatkan teks
              ),
            ),
            GridView.count(
              crossAxisCount:
                  2, // Atur menjadi 2 kolom untuk visibilitas lebih baik di perangkat mobile
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.6), // Sesuaikan rasio
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Nonaktifkan scroll pada GridView
              padding: const EdgeInsets.all(10.0),
              mainAxisSpacing: 10.0, // Jarak antara baris
              crossAxisSpacing: 10.0, // Jarak antara kolom
              children: [
                KartuBuku(
                  judul: 'Harry Potter and the philosophers stone',
                  penulis: 'J. K. Rowling',
                  gambar: './images/buku1.jpg', // Pastikan path yang benar
                  rating: 4.760000228881836,
                  halaman: 223,
                  stok: 5,
                ),
                KartuBuku(
                  judul: 'To kill a mockingbird',
                  penulis: 'Harper Lee',
                  gambar: './images/buku2.jpg',
                  rating: 4.0002009,
                  halaman: 250,
                  stok: 22,
                ),
                KartuBuku(
                  judul: '1984',
                  penulis: 'George Orwell',
                  gambar: './images/buku3.jpg',
                  rating: 4.5,
                  halaman: 300,
                  stok: 5,
                ),
                KartuBuku(
                  judul: 'pride and prejudice',
                  penulis: 'Jane Auten',
                  gambar: './images/buku4.jpg',
                  rating: 4.2,
                  halaman: 220,
                  stok: 1,
                ),
                KartuBuku(
                  judul: 'The Great Gastby',
                  penulis: 'F.Scott Fitzqerald',
                  gambar: './images/buku5.jpg',
                  rating: 4.7,
                  halaman: 432,
                  stok: 3,
                ),
                KartuBuku(
                  judul: 'the catcher In the Rye',
                  penulis: 'J.D.Saliqer',
                  gambar: './images/buku6.jpg',
                  rating: 4.6,
                  halaman: 328,
                  stok: 4,
                ),
                KartuBuku(
                  judul: 'The Hobbit',
                  penulis: 'J.R.R Tokien',
                  gambar: './images/buku7.jpg',
                  rating: 4.9,
                  halaman: 281,
                  stok: 2,
                ),
                KartuBuku(
                  judul: 'Fahrenheit41',
                  penulis: 'Ray Bradbury',
                  gambar: './images/buku8.jpg',
                  rating: 4.3,
                  halaman: 180,
                  stok: 12,
                ),
                KartuBuku(
                  judul: 'Negeri Para Bedebah',
                  penulis: 'Tere liye',
                  gambar: './images/buku9.jpg',
                  rating: 3.8,
                  halaman: 277,
                  stok: 5,
                ),
                KartuBuku(
                  judul: 'Moga Bunda Disayang Allah',
                  penulis: 'Tere Liye',
                  gambar: './images/buku10.jpg',
                  rating: 4.9,
                  halaman: 1216,
                  stok: 1,
                ),
                KartuBuku(
                  judul: 'The Alpha Girls Guide',
                  penulis: 'Herry Manampiring',
                  gambar: './images/buku11.jpg',
                  rating: 4.0,
                  halaman: 635,
                  stok: 0,
                ),
                KartuBuku(
                  judul: 'Pulang Pergi',
                  penulis: 'Leo Tolstoy',
                  gambar: './images/buku12.jpg',
                  rating: 4.5,
                  halaman: 1225,
                  stok: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class KartuBuku extends StatelessWidget {
  final String judul;
  final String penulis;
  final String gambar;
  final double rating;
  final int halaman;
  final int stok;

  KartuBuku({
    required this.judul,
    required this.penulis,
    required this.gambar,
    required this.rating,
    required this.halaman,
    required this.stok,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailBukuPage(
                judul: judul,
                penulis: penulis,
                gambar: gambar,
                rating: rating,
                halaman: halaman,
                stok: stok,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  gambar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan teks
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Warna teks pada kartu
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center, // Teks berada di tengah
                  ),
                  Text(
                    penulis,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          Color.fromARGB(255, 97, 97, 97), // Warna teks penulis
                    ),
                    textAlign: TextAlign.center, // Teks berada di tengah
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
