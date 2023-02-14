import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:image_search_app_prac/data/thumbnail_data/thumbnail_data.dart';

class ThumbnailJsonData {
  Future loadThumbnailAsset() async {
    return await rootBundle.loadString('assets/thumbnail.json');
  }

  Future<List<Thumbnail>> loadPhoto() async {
    String jsonString = await loadThumbnailAsset();
    final jsonResponse = jsonDecode(jsonString);

    ThumbnailList thumbnailList = ThumbnailList.fromJson(jsonResponse);

    return thumbnailList.thumbnails;
  }
}
