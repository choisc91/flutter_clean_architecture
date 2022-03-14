import 'dart:async';

import 'package:clean_architecture/data/api.dart';
import 'package:clean_architecture/model/Photo.dart';
import 'package:flutter/cupertino.dart';

class PixabayApiProvider extends InheritedWidget {

  final PixabayApi pixabayApi;

  final _streamCtrl = StreamController<List<Photo>>()..add([]);

  Stream<List<Photo>> get photoStream => _streamCtrl.stream;

  PixabayApiProvider({
    required Widget child,
    required this.pixabayApi,
  }) : super(child: child);

  static PixabayApiProvider of(BuildContext context) {
    final PixabayApiProvider? result =
        context.dependOnInheritedWidgetOfExactType<PixabayApiProvider>();
    assert(result != null, 'No pixabay api found in build context!');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await pixabayApi.fetch(query);
    _streamCtrl.add(result);
  }

  @override
  bool updateShouldNotify(PixabayApiProvider oldWidget) {
    return oldWidget.pixabayApi != pixabayApi;
  }
}
