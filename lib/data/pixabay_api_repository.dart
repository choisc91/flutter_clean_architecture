import 'package:clean_architecture/model/Photo.dart';

abstract class PixabayApiRepository {
  Future<List<Photo>> fetch(String query);
}