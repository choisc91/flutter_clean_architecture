import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@Freezed()
abstract class HomeEvent<T> with _$HomeEvent<T> {
  const factory HomeEvent.showMessage(String message) = ShowMessage;
}
