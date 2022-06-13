import 'dart:async';

import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/model/picture.dart';
import 'package:clean_architecture/domain/use_case/get_pictures_use_case.dart';
import 'package:clean_architecture/presentation/home/home_event.dart';
import 'package:clean_architecture/presentation/home/home_state.dart';
import 'package:flutter/cupertino.dart';

// View model 은 데이터 가공하는 로직 없이, View 에 데이터를 제공하는 역활만 할 것.
class HomeViewModel with ChangeNotifier {
  final GetPicturesUseCase _useCase;

  // 화면 상태관리 클래스.
  HomeState _state = HomeState([], false);

  HomeState get state => _state;

  final _eventCtrl = StreamController<HomeEvent>();

  Stream<HomeEvent> get eventCtrl => _eventCtrl.stream;

  HomeViewModel(this._useCase);

  VoidCallback? callback;

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Picture>> result = await _useCase.execute(query);
    result.when(
      success: (pictures) {
        _state = state.copyWith(pictures: pictures);
        notifyListeners();
      },
      error: (message) {
        _eventCtrl.add(HomeEvent.showMessage(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
