import 'package:clean_architecture/data/pixabay_api_repository.dart';
import 'package:clean_architecture/model/Photo.dart';
import 'package:clean_architecture/ui/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Stream is success', () async {
    final viewModel = HomeViewModel(FakeRepository());

    await viewModel.fetch('apple');
    await viewModel.fetch('android');

    expect(
      viewModel.photoStream,
      emitsInOrder(
        [
          equals([]),
          equals(fakeJson.map((e) => Photo.fromJson(e)).toList()),
          equals(fakeJson.map((e) => Photo.fromJson(e)).toList()),
        ],
      ),
    );
  });
}

class FakeRepository extends PixabayApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 1000));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

final List<Map<String, dynamic>> fakeJson = [
  {
    "id": 1127174,
    "pageURL":
        "https://pixabay.com/photos/sunflower-flower-plant-petals-1127174/",
    "type": "photo",
    "tags": "sunflower, flower, plant",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/01/08/05/24/sunflower-1127174_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g71da15441630bfba6f8e9839d826f0edb4862fef2fc9f853c059c5384d188a7457152530686dd4790e18ad594501dc8e304e767a48d34151995bab9a9fd2564a_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gbfdbbc2e3fec088ef903cba60a3ee1a88117fe834d76a50dd636bf170171a26c99d17d618480f86a35c9559c70eaee76fed2c35c883375fe03a7f33ab1d8b3df_1280.jpg",
    "imageWidth": 4752,
    "imageHeight": 3168,
    "imageSize": 3922163,
    "views": 336753,
    "downloads": 205457,
    "collections": 4794,
    "likes": 910,
    "comments": 122,
    "user_id": 1445608,
    "user": "mploscar",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
  },
  {
    "id": 887443,
    "pageURL":
        "https://pixabay.com/photos/flower-life-yellow-flower-crack-887443/",
    "type": "photo",
    "tags": "flower, life, yellow flower",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/08/13/20/06/flower-887443_150.jpg",
    "previewWidth": 150,
    "previewHeight": 116,
    "webformatURL":
        "https://pixabay.com/get/g324833eb19dc6320c03d043134eae5c82c4a9381e94f159d38774e6d79841b85cafeb784b9b21a9b66664ee001742eb1_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 497,
    "largeImageURL":
        "https://pixabay.com/get/gd7e76d3a7228c9c4fb06f8bc69fa17860a7c45c308952453227b06ae2c8aff6c2938740a304306f8602bb0dd57a59d7f2d0fe11d711c1b7102e0f3201aa5fba9_1280.jpg",
    "imageWidth": 3867,
    "imageHeight": 3005,
    "imageSize": 2611531,
    "views": 276700,
    "downloads": 164944,
    "collections": 4335,
    "likes": 1028,
    "comments": 171,
    "user_id": 1298145,
    "user": "klimkin",
    "userImageURL":
        "https://cdn.pixabay.com/user/2017/07/18/13-46-18-393_250x250.jpg"
  },
];
