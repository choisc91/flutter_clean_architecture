import 'dart:async';
import 'dart:collection';

import 'package:clean_architecture/domain/repository/pixabay_api_repository.dart';
import 'package:clean_architecture/domain/model/picture.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final PixabayApiRepository repository;

  List<Picture> _pictures = [];

  List<Picture> get pictures => _pictures;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _pictures = result;
    notifyListeners();
  }
}
