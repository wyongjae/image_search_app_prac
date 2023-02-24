import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/thumbnail_data_repository/thumbnail_data_repository.dart';
import 'package:image_search_app_prac/model/thumbnail.dart';

class ThumbnailSearchViewModel extends ChangeNotifier {
  ThumbnailDataRepository repository;

  ThumbnailSearchViewModel(this.repository);

  bool isLoading = false;

  List<Thumbnail> thumbnails = [];

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    thumbnails = await repository.loadThumbnail();
    isLoading = false;
    notifyListeners();
  }
}
