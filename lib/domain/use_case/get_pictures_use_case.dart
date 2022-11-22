//
import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/model/picture.dart';
import 'package:clean_architecture/domain/repository/pixabay_api_repository.dart';

class GetPicturesUseCase {
  final PixabayApiRepository _repository;

  GetPicturesUseCase(this._repository);

  Future<Result<List<Picture>>> execute(String query) async {
    final Result<List<Picture>> result = await _repository.fetch(query);
    return result.when(
      success: (pictures) => Result.success(pictures),
      error: (message) => Result.error(message),
    );
  }
}
