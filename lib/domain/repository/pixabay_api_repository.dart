
import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/model/picture.dart';

abstract class PixabayApiRepository {
  Future<Result<List<Picture>>> fetch(String query);
}