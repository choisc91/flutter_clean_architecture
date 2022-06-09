import 'dart:convert';

import 'package:clean_architecture/data/data_source/result.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';

  static const apiKey = '26131079-5bca26675953d8e1029c3e88e';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'));
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    } catch (e) {
      return const Result.error('Network error');
    }
  }
}
