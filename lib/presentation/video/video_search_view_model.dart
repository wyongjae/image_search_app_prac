import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/video_data_repository/video_data_repository.dart';
import 'package:image_search_app_prac/model/video_data.dart';

class VideoSearchViewModel extends ChangeNotifier {
  VideoDataRepository repository;

  VideoSearchViewModel(this.repository);

  List<Video> _videos = [];

  List<Video> get videos => _videos;

  Future<void> fetch(String query) async {
    _videos = await repository.jsonData.loadVideo(query);
    notifyListeners();
  }
}
