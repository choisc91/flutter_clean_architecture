import 'package:clean_architecture/data/api.dart';
import 'package:flutter/cupertino.dart';

class PixabayApiProvider extends InheritedWidget {
  final PixabayApi pixabayApi;

  const PixabayApiProvider({
    required Widget child,
    required this.pixabayApi,
  }) : super(child: child);

  static PixabayApiProvider of(BuildContext context) {
    final PixabayApiProvider? result =
        context.dependOnInheritedWidgetOfExactType<PixabayApiProvider>();
    assert(result != null, 'No pixabay api found in build context!');
    return result!;
  }

  @override
  bool updateShouldNotify(PixabayApiProvider oldWidget) {
    return oldWidget.pixabayApi != pixabayApi;
  }
}
