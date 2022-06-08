import 'package:clean_architecture/model/picture.dart';

abstract class PixabayApiRepository {
  Future<List<Picture>> fetch(String query);
}