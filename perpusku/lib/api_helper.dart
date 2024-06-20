// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   final String baseUrl;
//   final String token;

//   ApiService({required this.baseUrl, required this.token});

//   Future<List<dynamic>> fetchHistory() async {
//     try {
//       final response = await http.get(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       // Log response status and body for debugging
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to load history. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Log the error for debugging purposes
//       print('Error fetching history: $e');
//       throw Exception('Failed to load history: $e');
//     }
//   }
// }
