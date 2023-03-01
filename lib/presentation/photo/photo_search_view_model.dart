import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_state.dart';

class PhotoSearchViewModel with ChangeNotifier {
  PhotoDataRepository repository;

  var _state = PhotoSearchState();

  PhotoSearchState get state => _state;

  PhotoSearchViewModel(this.repository);

  Future<void> fetchRepository(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final photos = await repository.getPhotos(query);

    _state = state.copyWith(
      isLoading: false,
      photos: photos,
    );

    notifyListeners();
  }
}
