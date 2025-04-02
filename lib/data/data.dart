import 'dart:convert';
import 'package:flutter/services.dart';

class NewsService {
  static Future<List<Map<String, dynamic>>> loadNews() async {
    final String response =
        await rootBundle.loadString('assets/data/news.json');
    final List<dynamic> data = json.decode(response);
    return data.cast<Map<String, dynamic>>();
  }
}
