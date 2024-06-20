import 'package:flutter/material.dart';

class KoleksiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koleksi'),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Warna latar belakang
              borderRadius: BorderRadius.circular(8), // Membuat border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Warna bayangan
                  spreadRadius: 2, // Jarak bayangan
                  blurRadius: 5, // Tingkat kabur bayangan
                  offset: Offset(0, 3), // Offset bayangan
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'), // Gambar latar belakang
                fit: BoxFit.cover, // Cara gambar diposisikan
              ),
            ),
            padding: EdgeInsets.all(16), // Padding konten di dalam container
            child: Text(
              'Konten di dalam Container',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Kategori',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                KategoriItem(icon: Icons.book, label: 'Fiksi', books: [
                  BukuTerbaruItem(
                    judul: 'Harry Potter And the Philosophers Stone',
                    penulis: 'J. K. Rowling',
                    cover: './images/buku1.jpg',
                    rating: 4.8,
                    stok: 5,
                    sinopsis: 'Harry Potter kembali untuk tahun ketiganya di Hogwarts School of Witchcraft and Wizardry, dan seperti biasa, tahun ajaran baru tidak berjalan lancar. Di tengah-tengah kekhawatiran tentang tawanan yang melarikan diri, Harry harus menghadapi tantangan baru, termasuk makhluk misterius yang mengancam murid-murid Hogwarts. Bersama dengan teman-temannya Ron dan Hermione, Harry menggali lebih dalam tentang masa lalu keluarganya yang tragis, sambil berusaha menjaga Hogwarts dari bahaya yang mengintai.',
                  ),
                   BukuTerbaruItem(
                    judul: 'ARGANTARA',
                    penulis: 'Falistiyana',
                    cover: './images/buku2.jpg',
                    rating: 4.9,
                    stok: 3,
                    sinopsis: 'ARGANTARA" adalah kisah yang dipenuhi dengan petualangan dari awal hingga akhir. Kisah ini mengikuti perjalanan Argantara, seorang tokoh utama dalam dunia fantasi yang penuh dengan misteri dan keajaiban. Dalam perjalanan hidupnya, Argantara menghadapi berbagai tantangan dan ujian yang menguji keberaniannya serta kebijaksanaannya.',
                  ),
                   BukuTerbaruItem(
                    judul: 'EccedentesiasT Canva Narendra',
                    penulis: 'ITAKRN',
                    cover: './images/buku5.jpg',
                    rating: 4.9,
                    stok: 3,
                    sinopsis: 'Novel Eccedentesiast mengikuti kisah Canva Narendra, seorang laki-laki yang sangat menyayangi keluarganya. Akan tetapi, Canva merasa ditinggalkan oleh papa dan mama yang bekerja di luar negeri. Alhasil, Canva harus tinggal bersama sang nenek dan kehilangan sosok orang tua yang hadir menemani kesehariannya.',
                  ),
                  BukuTerbaruItem(
                    judul: 'Rembulan Tenggelam Di Wajahmu',
                    penulis: 'TERE LIYE',
                    cover: './images/buku7.jpg',
                    rating: 4.7,
                    stok: 2,
                    sinopsis: 'Kisah Argantara yang penuh dengan petualangan...',
                  ),
                ]),
                KategoriItem(icon: Icons.science, label: 'Sains', books: [
                  BukuTerbaruItem(
                    judul: 'BUMI',
                    penulis: 'TERE LIYE',
                    cover: './images/buku8.jpg',
                    rating: 4.9,
                    stok: 3,
                    sinopsis: 'Buku ini menjelaskan tentang asal-usul alam semesta...',
                  ),
                   BukuTerbaruItem(
                    judul: 'The Alpha Girl Guide',
                    penulis: 'Harry Manampiring',
                    cover: './images/buku11.jpg',
                    rating: 4.9,
                    stok: 3,
                    sinopsis: 'Buku ini menjelaskan tentang asal-usul alam semesta...',
                  ),
                   BukuTerbaruItem(
                    judul: 'NEGERI PARA BEDEBAH',
                    penulis: 'TERE LIYE',
                    cover: './images/buku9.jpg',
                    rating: 4.9,
                    stok: 3,
                    sinopsis: 'Buku ini menjelaskan tentang asal-usul alam semesta...',
                  ),
                  BukuTerbaruItem(
                    judul: 'The Selfish Gene',
                    penulis: 'Richard Dawkins',
                    cover: 'assets/images/buku4.jpg',
                    rating: 4.5,
                    stok: 4,
                    sinopsis: 'Buku ini memperkenalkan konsep gen egois...',
                  ),
                ]),
                KategoriItem(icon: Icons.history, label: 'Sejarah', books: [
                  BukuTerbaruItem(
                    judul: 'Sejarah Dunia Lengkap',
                    penulis: 'HUTTON WEBSTER PHD',
                    cover: './images/buku11.jpg',
                    rating: 4.8,
                    stok: 6,
                    sinopsis: 'Buku ini menceritakan tentang evolusi manusia...',
                  ),
                   BukuTerbaruItem(
                    judul: 'Educated',
                    penulis: 'TARA WESTOVER',
                    cover: './images/buku10.jpg',
                    rating: 4.9,
                    stok: 3,
                    sinopsis: 'Buku ini menjelaskan tentang asal-usul alam semesta...',
                  ),
                   BukuTerbaruItem(
                    judul: 'Sejarah Teh',
                    penulis: '',
                    cover: './images/buku9.jpg',
                    rating: 4.9,
                    stok: 3,
                    sinopsis: 'Buku ini menjelaskan tentang asal-usul alam semesta...',
                  ),
                  BukuTerbaruItem(
                    judul: 'Moga Bunda Disayang Allah',
                    penulis: 'TERE LIYE',
                    cover: './images/buku5.jpg',
                    rating: 4.6,
                    stok: 5,
                    sinopsis: 'Analisis mengapa peradaban berkembang berbeda di berbagai belahan dunia...',
                  ),
                ]),
                // Tambahkan kategori lain dengan buku-buku mereka
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Buku Terbaru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          DaftarBukuTerbaru(),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Buku Populer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          DaftarBukuPopuler(),
        ],
      ),
    );
  }
}


class KategoriItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final List<BukuTerbaruItem> books;

  KategoriItem({required this.icon, required this.label, required this.books});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KategoriDetailPage(label: label, books: books),
          ),
        );
      },
      child: Container(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(icon, size: 30),
            ),
            SizedBox(height: 8),
            Text(label, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class KategoriDetailPage extends StatelessWidget {
  final String label;
  final List<BukuTerbaruItem> books;

  KategoriDetailPage({required this.label, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BukuTerbaruItem(
                      judul: books[index].judul,
                      penulis: books[index].penulis,
                      cover: books[index].cover,
                      rating: books[index].rating,
                      stok: books[index].stok,
                      sinopsis: books[index].sinopsis,
                      dipinjam: books[index].dipinjam,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DaftarBukuTerbaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 300,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 4, // Sesuaikan jumlah item
        itemBuilder: (context, index) {
          return BukuTerbaruItem(
            judul: 'Judul Buku ${index + 1}',
            penulis: 'Penulis ${index + 1}',
            cover: 'assets/images/cover${index + 1}.jpg',
            dipinjam: false,
            rating: 4.5,
            stok: 10,
            sinopsis: 'Sinopsis buku ${index + 1}...',
          );
        },
      ),
    );
  }
}

class DaftarBukuPopuler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 300,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 4, // Sesuaikan jumlah item
        itemBuilder: (context, index) {
          return BukuPopulerItem(
            judul: 'Judul Buku ${index + 3}',
            penulis: 'Penulis ${index + 3}',
            cover: 'assets/images/cover${index + 3}.jpg',
            rating: 4.6,
            stok: 5,
            sinopsis: 'Sinopsis buku ${index + 3}...',
          );
        },
      ),
    );
  }
}

class BukuTerbaruItem extends StatefulWidget {
  final String judul;
  final String penulis;
  final String cover;
  bool dipinjam;
  final double rating;
  final int stok;
  final String sinopsis;

  BukuTerbaruItem({
    required this.judul,
    required this.penulis,
    required this.cover,
    this.dipinjam = false,
    required this.rating,
    required this.stok,
    required this.sinopsis,
  });

  @override
  _BukuTerbaruItemState createState() => _BukuTerbaruItemState();
}

class _BukuTerbaruItemState extends State<BukuTerbaruItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BukuDetailPage(
              judul: widget.judul,
              penulis: widget.penulis,
              cover: widget.cover,
              rating: widget.rating,
              stok: widget.stok,
              sinopsis: widget.sinopsis,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.cover,
              height: 140,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              widget.judul,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.penulis),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.dipinjam = !widget.dipinjam;
                });
              },
              child: Text(widget.dipinjam ? 'Kembalikan' : 'Pinjam'),
            ),
          ],
        ),
      ),
    );
  }
}

class BukuPopulerItem extends StatefulWidget {
  final String judul;
  final String penulis;
  final String cover;
  final double rating;
  final int stok;
  final String sinopsis;

  BukuPopulerItem({
    required this.judul,
    required this.penulis,
    required this.cover,
    required this.rating,
    required this.stok,
    required this.sinopsis,
  });

  @override
  _BukuPopulerItemState createState() => _BukuPopulerItemState();
}

class _BukuPopulerItemState extends State<BukuPopulerItem> {
  bool dipinjam = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BukuDetailPage(
              judul: widget.judul,
              penulis: widget.penulis,
              cover: widget.cover,
              rating: widget.rating,
              stok: widget.stok,
              sinopsis: widget.sinopsis,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.cover,
              height: 140,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              widget.judul,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.penulis),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  dipinjam = !dipinjam;
                });
              },
              child: Text(dipinjam ? 'Kembalikan' : 'Pinjam'),
            ),
          ],
        ),
      ),
    );
  }
}

class BukuDetailPage extends StatelessWidget {
  final String judul;
  final String penulis;
  final String cover;
  final double rating;
  final int stok;
  final String sinopsis;

  BukuDetailPage({
    required this.judul,
    required this.penulis,
    required this.cover,
    required this.rating,
    required this.stok,
    required this.sinopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              cover,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              judul,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Penulis: $penulis',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text('$rating'),
              ],
            ),
            SizedBox(height: 8),
            Text('Stok: $stok'),
            SizedBox(height: 16),
            Text(
              'Sinopsis:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(sinopsis),
          ],
        ),
      ),
    );
  }
}