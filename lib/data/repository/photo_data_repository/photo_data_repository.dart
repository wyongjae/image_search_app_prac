import 'dart:async';

import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/model/photo_data.dart';

class PhotoDataRepository {
  PhotoJsonData data;

  PhotoDataRepository(this.data);

  Future<List<Photo>> getPhotos(String query) async {
    return data.fetchApi(query);
  }
}
