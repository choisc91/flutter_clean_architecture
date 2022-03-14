import 'dart:convert';
import 'package:clean_architecture/data/pixabay_api_repository.dart';
import 'package:http/http.dart' as http;
import 'package:clean_architecture/model/Photo.dart';

class PixabayApi implements PixabayApiRepository {
  final baseUrl = 'https://pixabay.com/api/';

  final apiKey = '26131079-5bca26675953d8e1029c3e88e';

  @override
  Future<List<Photo>> fetch(String query) async {
    final uri = Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo');
    final response = await http.get(uri);
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
