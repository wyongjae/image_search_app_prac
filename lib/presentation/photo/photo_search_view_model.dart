import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app_prac/domain/model/photo/photo.dart';
import 'package:image_search_app_prac/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_state.dart';
import 'package:image_search_app_prac/presentation/photo/photo_ui_event.dart';
import 'package:image_search_app_prac/util/result.dart';

class PhotoSearchViewModel with ChangeNotifier {
  GetPhotosUseCase getPhotosUseCase;

  var _state = PhotoSearchState();

  PhotoSearchState get state => _state;

  final _eventStreamController = StreamController<PhotoUiEvent>();

  Stream<PhotoUiEvent> get eventStream => _eventStreamController.stream;

  PhotoSearchViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await getPhotosUseCase(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(
          isLoading: false,
          photos: photos,
        );
        notifyListeners();
      },
      error: (message) {
        _eventStreamController.add(PhotoUiEvent.showSnackBar(message));
      },
    );
  }

  void isEmptyError(String text) {
    if (text.isEmpty) {
      _eventStreamController
          .add(const PhotoUiEvent.showSnackBar('검색어를 입력해주세요'));
    }
  }
}
