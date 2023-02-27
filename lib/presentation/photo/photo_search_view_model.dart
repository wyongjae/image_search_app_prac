import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/model/photo/photo.dart';

class PhotoSearchViewModel with ChangeNotifier {
  PhotoDataRepository repository;

  PhotoSearchViewModel(this.repository);

  List<Photo> _photos = [];

  List<Photo> get photos => UnmodifiableListView(_photos);

  Future<void> fetchRepository(String query) async {
    _photos = await repository.getPhotos(query);
    notifyListeners();
  }
}
