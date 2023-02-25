import 'dart:async';

import 'package:image_search_app_prac/data/data/video_data/video_json_data.dart';
import 'package:image_search_app_prac/model/video_data.dart';

class VideoDataRepository {
  VideoJsonData jsonData;

  VideoDataRepository(this.jsonData);

  Future<List<Video>> getVideos(String query) async {
    return jsonData.loadVideo(query);
  }
}
