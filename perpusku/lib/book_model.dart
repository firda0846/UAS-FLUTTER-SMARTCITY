// // book_model.dart

// class Book {
//   final String judul;
//   final String penulis;
//   final double rating;
//   final int halaman;
//   final int stok;

//   Book({
//     required this.judul,
//     required this.penulis,
//     required this.rating,
//     required this.halaman,
//     required this.stok,
//   });

//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(
//       judul: json['judul'] ?? '',
//       penulis: json['penulis'] ?? '',
//       rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
//       halaman: json['halaman'] ?? 0,
//       stok: json['stok'] ?? 0,
//     );
//   }
// }
