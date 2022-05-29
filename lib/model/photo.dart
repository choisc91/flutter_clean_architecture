import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

// 모델 클래스의 데이터 구조 변경 후 무조건 build_runner 다시 build 할 것.
@JsonSerializable()
class Photo extends Equatable {
  final int id;
  final String tags;

  // 맵핑.
  @JsonKey(name: 'largeImageURL')
  final String url;

  const Photo({
    required this.id,
    required this.tags,
    required this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [id];
}

// class Photo {
//   Photo({
//     required this.id,
//     required this.pageURL,
//     required this.type,
//     required this.tags,
//     required this.previewURL,
//     required this.previewWidth,
//     required this.previewHeight,
//     required this.webformatURL,
//     required this.webformatWidth,
//     required this.webformatHeight,
//     required this.largeImageURL,
//     required this.imageWidth,
//     required this.imageHeight,
//     required this.imageSize,
//     required this.views,
//     required this.downloads,
//     required this.collections,
//     required this.likes,
//     required this.comments,
//     required this.userId,
//     required this.user,
//     required this.userImageURL,
//   });
//
//   late final int id;
//   late final String pageURL;
//   late final String type;
//   late final String tags;
//   late final String previewURL;
//   late final int previewWidth;
//   late final int previewHeight;
//   late final String webformatURL;
//   late final int webformatWidth;
//   late final int webformatHeight;
//   late final String largeImageURL;
//   late final int imageWidth;
//   late final int imageHeight;
//   late final int imageSize;
//   late final int views;
//   late final int downloads;
//   late final int collections;
//   late final int likes;
//   late final int comments;
//   late final int userId;
//   late final String user;
//   late final String userImageURL;
//
//   Photo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     pageURL = json['pageURL'];
//     type = json['type'];
//     tags = json['tags'];
//     previewURL = json['previewURL'];
//     previewWidth = json['previewWidth'];
//     previewHeight = json['previewHeight'];
//     webformatURL = json['webformatURL'];
//     webformatWidth = json['webformatWidth'];
//     webformatHeight = json['webformatHeight'];
//     largeImageURL = json['largeImageURL'];
//     imageWidth = json['imageWidth'];
//     imageHeight = json['imageHeight'];
//     imageSize = json['imageSize'];
//     views = json['views'];
//     downloads = json['downloads'];
//     collections = json['collections'];
//     likes = json['likes'];
//     comments = json['comments'];
//     userId = json['user_id'];
//     user = json['user'];
//     userImageURL = json['userImageURL'];
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Photo && runtimeType == other.runtimeType && id == other.id;
//
//   @override
//   int get hashCode => id.hashCode;
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['pageURL'] = pageURL;
//     _data['type'] = type;
//     _data['tags'] = tags;
//     _data['previewURL'] = previewURL;
//     _data['previewWidth'] = previewWidth;
//     _data['previewHeight'] = previewHeight;
//     _data['webformatURL'] = webformatURL;
//     _data['webformatWidth'] = webformatWidth;
//     _data['webformatHeight'] = webformatHeight;
//     _data['largeImageURL'] = largeImageURL;
//     _data['imageWidth'] = imageWidth;
//     _data['imageHeight'] = imageHeight;
//     _data['imageSize'] = imageSize;
//     _data['views'] = views;
//     _data['downloads'] = downloads;
//     _data['collections'] = collections;
//     _data['likes'] = likes;
//     _data['comments'] = comments;
//     _data['user_id'] = userId;
//     _data['user'] = user;
//     _data['userImageURL'] = userImageURL;
//     return _data;
//   }
//
//   @override
//   String toString() {
//     return 'Photo{id: $id}';
//   }
// }
