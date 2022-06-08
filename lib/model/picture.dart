import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';

part 'picture.g.dart';

@Freezed()
class Picture with _$Picture {
  factory Picture({
    required int id,
    required String tags,
    required String largeImageURL,
  }) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
}
