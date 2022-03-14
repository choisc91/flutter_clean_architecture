import 'package:clean_architecture/ui/home_view_model.dart';
import 'package:flutter/cupertino.dart';

class PixabayApiProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  const PixabayApiProvider({
    required Widget child,
    required this.viewModel,
  }) : super(child: child);

  static PixabayApiProvider of(BuildContext context) {
    final PixabayApiProvider? result =
        context.dependOnInheritedWidgetOfExactType<PixabayApiProvider>();
    assert(result != null, 'No pixabay api found in build context!');
    return result!;
  }

  @override
  bool updateShouldNotify(PixabayApiProvider oldWidget) {
    return true;
  }
}
