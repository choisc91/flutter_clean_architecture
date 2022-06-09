
import 'package:clean_architecture/domain/model/picture.dart';

abstract class PixabayApiRepository {
  Future<List<Picture>> fetch(String query);
}