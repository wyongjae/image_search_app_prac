import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:image_search_app_prac/data/repository/thumbnail_data_repository/thumbnail_data_repository.dart';
import 'package:image_search_app_prac/model/thumbnail.dart';

class ThumbnailJsonData implements ThumbnailDataRepository {
  Future loadThumbnailAsset() async {
    return await rootBundle.loadString('assets/thumbnail.json');
  }

  @override
  Future<List<Thumbnail>> loadThumbnail() async {
    await Future.delayed(const Duration(seconds: 3));
    String jsonString = await loadThumbnailAsset();
    List<dynamic> jsonResponse = jsonDecode(jsonString);

    return jsonResponse.map((e) => Thumbnail.fromJson(e)).toList();
  }
}
