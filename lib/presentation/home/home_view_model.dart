import 'dart:async';
import 'dart:collection';

import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/repository/pixabay_api_repository.dart';
import 'package:clean_architecture/domain/model/picture.dart';
import 'package:clean_architecture/presentation/home/home_event.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final PixabayApiRepository repository;

  List<Picture> _pictures = [];

  List<Picture> get pictures => _pictures;

  final _eventCtrl = StreamController<HomeEvent>();

  Stream<HomeEvent> get eventCtrl => _eventCtrl.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final Result<List<Picture>> result = await repository.fetch(query);
    result.when(
      success: (pictures) {
        _pictures = pictures;
        notifyListeners();
      },
      error: (message) {
        _eventCtrl.add(HomeEvent.showMessage(message));
      },
    );
  }
}
