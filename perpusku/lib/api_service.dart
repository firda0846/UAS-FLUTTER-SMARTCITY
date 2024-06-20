import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'http://192.168.1.61:3000';

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

 Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    print('Token removed, user logged out.');
  }


  Future<List<dynamic>> fetchHistory() async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/history'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load history. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching history: $e');
      throw Exception('Failed to load history: $e');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      await saveToken(responseData['token']); // Save the token
      return responseData;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<http.Response?> submitPengembalian(Map<String, dynamic> data) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }

    final url = Uri.parse('$baseUrl/users/posting');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    if (!data.containsKey('judul')) {
      throw Exception('Judul is required');
    }

    final body = jsonEncode(data);

    print('Request URL: $url');
    print('Request Headers: $headers');
    print('Request Body: $body');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return response;
    } catch (e) {
      print('HTTP request error: $e');
      return null;
    }
  }

  Future<List<dynamic>> getEdukasi() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/edukasi'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load edukasi: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> getBookById(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/edukasi/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load edukasi: ${response.body}');
    }
  }
}
