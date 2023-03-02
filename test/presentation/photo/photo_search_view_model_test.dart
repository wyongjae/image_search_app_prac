import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/domain/model/photo/photo.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_view_model.dart';

void main() {
  test('repository 에서 데이터를 가져온다', () async {
    final viewModel =
        PhotoSearchViewModel(FakePhotoApiRepository(PhotoJsonData()));

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos.first.id, 634572);
    expect(viewModel.state.copyWith(photos: result).photos, result);
  });
}

class FakePhotoApiRepository extends PhotoDataRepository {
  FakePhotoApiRepository(super.jsonData);

  @override
  Future<List<Photo>> getPhotos(String query) async {
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/gbf7970c8dc10129b0bd18fd03567a323aca373dbfa627231b94151beb075c59349c28e536b34aba247928b81121ab67b_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g4826d03ba30ece6339b2c5b8df6f58aaca737994fdb7c49079e7dd0f04ab99150cd96286c389092a83d98ae6c4da57b99863429b0e92d21822082b156b3b616a_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 471636,
    "downloads": 274988,
    "collections": 1267,
    "likes": 2351,
    "comments": 192,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g1bba201b98ac7e1bff414319e217d35b3a67b478e00e793e39f56f509ab4bc0b30518553735211fceac254ac84f91758455b83599a866bb0477e7e9608433a5e_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g7a4537256e9141d171248ef91347859755de69bc5b5e3b382f9a518afec77325d4a8d901e18425d58ff91c05a811c77c668fac2c56c74ed4f740f46718298ff0_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 678340,
    "downloads": 492945,
    "collections": 1374,
    "likes": 1028,
    "comments": 274,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
];
