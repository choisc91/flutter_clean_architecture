import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  factory Photo({
    required int id,
    required String tags,
    required String largeImageURL,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

// 모델 클래스의 데이터 구조 변경 후 무조건 build_runner 다시 build 할 것.
// @JsonSerializable()
// class Photo extends Equatable {
//   final int id;
//   final String tags;
//
//   // 맵핑.
//   @JsonKey(name: 'largeImageURL')
//   final String url;
//
//   const Photo({
//     required this.id,
//     required this.tags,
//     required this.url,
//   });
//
//   factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
//
//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$PhotoToJson(this);
//
//   @override
//   List<Object?> get props => [id];
// }
