import 'dart:async';

import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/domain/model/photo/photo.dart';

class PhotoDataRepository {
  PhotoJsonData jsonData;

  PhotoDataRepository(this.jsonData);

  Future<List<Photo>> getPhotos(String query) async {
    return jsonData.fetchApi(query);
  }
}
