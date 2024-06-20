import 'package:flutter/material.dart';
import 'api_service.dart';

class NotificationsPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            String errorMessage = 'Error: ${snapshot.error}';
            if (snapshot.error.toString().contains('401')) {
              errorMessage = 'Unauthorized: Please check your token.';
            } else if (snapshot.error.toString().contains('400')) {
              errorMessage = 'Bad Request: Please check the request parameters.';
            }
            return Center(child: Text(errorMessage));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No history available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final history = snapshot.data![index];
                return ListTile(
                  title: Text(history['title']),
                  subtitle: Text(history['description']),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationsPage(),
  ));
}
