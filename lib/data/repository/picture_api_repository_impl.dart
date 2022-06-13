import 'package:clean_architecture/data/data_source/pixabay_api.dart';
import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/repository/pixabay_api_repository.dart';
import 'package:clean_architecture/domain/model/picture.dart';
import 'package:http/http.dart' as http;

class PictureApiRepositoryImpl implements PixabayApiRepository {
  final PixabayApi _api;

  PictureApiRepositoryImpl(this._api);

  @override
  Future<Result<List<Picture>>> fetch(String query) async {
    final Result<Iterable> result = await _api.fetch(query);
    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Picture.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
