import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<List<dynamic>> getNews() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data ?? data;
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}
