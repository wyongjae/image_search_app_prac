import 'dart:async';

import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/model/photo_data.dart';

class PhotoDataRepository {
  PhotoJsonData jsonData;

  PhotoDataRepository(this.jsonData);

  final _photoStreamController = StreamController<List<Photo>>();

  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<void> fetchPhoto(String query) async {
    final result = await jsonData.fetchApi(query);
    _photoStreamController.add(result);
  }
}
