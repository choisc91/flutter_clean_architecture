//
import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/model/picture.dart';
import 'package:clean_architecture/domain/repository/pixabay_api_repository.dart';

// 데이터 관련 가공은 이곳에서 작성하고, 뷰모델이 참조하도록 코딩.
class GetPicturesUseCase {
  final PixabayApiRepository _repository;

  GetPicturesUseCase(this._repository);

  Future<Result<List<Picture>>> execute(String query) async {
    final Result<List<Picture>> result = await _repository.fetch(query);
    return result.when(
      success: (pictures) {
        // 가공 작업은 여기서.
        return Result.success(pictures);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
