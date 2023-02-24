import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/model/photo_data.dart';

class PhotoSearchViewModel extends ChangeNotifier {
  PhotoDataRepository repository;

  PhotoSearchViewModel(this.repository);

  List<Photo> photos = [];

  Future<void> fetchRepository(String query) async {
    photos = await repository.getPhotos(query);
    notifyListeners();
  }
}
