import 'package:flutter/material.dart';
import 'api_service.dart'; // Ensure correct import of ApiHelper

class PengembalianPage extends StatefulWidget {
  @override
  _PengembalianPageState createState() => _PengembalianPageState();
}

class _PengembalianPageState extends State<PengembalianPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _halamanController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();

  final ApiService apiService = ApiService(); // Create an instance of ApiHelper

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await apiService.submitPengembalian({
          'judul': _judulController.text,
          'penulis': _penulisController.text,
          'rating': double.parse(_ratingController.text),
          'halaman': int.parse(_halamanController.text),
          'stok': int.parse(_stokController.text),
        });

        if (response != null && response.statusCode == 201) { // Handle status code 201
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data berhasil disimpan')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal menyimpan data')));
        }
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal menyimpan data: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pengembalian Buku'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: InputDecoration(
                  labelText: 'Judul',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Judul';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _penulisController,
                decoration: InputDecoration(
                  labelText: 'Penulis',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Penulis';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ratingController,
                decoration: InputDecoration(
                  labelText: 'Rating',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Rating';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _halamanController,
                decoration: InputDecoration(
                  labelText: 'Halaman',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Halaman';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stokController,
                decoration: InputDecoration(
                  labelText: 'Stok',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Stok';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: Icon(Icons.save),
                  label: Text('Kembalikan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PengembalianPage(),
  ));
}
