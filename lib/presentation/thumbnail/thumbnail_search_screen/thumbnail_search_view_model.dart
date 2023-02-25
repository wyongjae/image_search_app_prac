import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/thumbnail_data_repository/thumbnail_data_repository.dart';
import 'package:image_search_app_prac/model/thumbnail.dart';

class ThumbnailSearchViewModel with ChangeNotifier {
  ThumbnailDataRepository repository;

  ThumbnailSearchViewModel(this.repository);

  final bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Thumbnail> _thumbnails = [];

  List<Thumbnail> get thumbnails => UnmodifiableListView(_thumbnails);

  bool loading({bool? isLoading}) {
    return isLoading ??= this.isLoading;
  }

  Future<void> fetch() async {
    loading(isLoading: true);
    notifyListeners();

    _thumbnails = await repository.loadThumbnail();
    loading(isLoading: false);
    notifyListeners();
  }
}
