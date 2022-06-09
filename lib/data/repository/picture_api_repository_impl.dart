import 'package:clean_architecture/data/data_source/pixabay_api.dart';
import 'package:clean_architecture/domain/repository/pixabay_api_repository.dart';
import 'package:clean_architecture/domain/model/picture.dart';
import 'package:http/http.dart' as http;

class PictureApiRepositoryImpl implements PixabayApiRepository {
  final _api = PixabayApi(http.Client());

  @override
  Future<List<Picture>> fetch(String query) async {
    final result = await _api.fetch(query);
    return result.map((e) => Picture.fromJson(e)).toList();
  }
}
