import 'package:clean_architecture/domain/model/picture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@Freezed()
class HomeState with _$HomeState {
  factory HomeState(List<Picture> pictures,
      bool isLoading,) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
}

