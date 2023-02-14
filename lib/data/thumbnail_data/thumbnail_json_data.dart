import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image_search_app_prac/data/thumbnail_data/thumbnail_data.dart';

class ThumbnailJsonData {
  Future loadThumbnailAsset() async {
    return await rootBundle.loadString('assets/thumbnail.json');
  }

  Future<List<Thumbnail>> loadThumbnail() async {
    String jsonString = await loadThumbnailAsset();
    List<dynamic> jsonResponse = jsonDecode(jsonString);

    return jsonResponse.map((e) => Thumbnail.fromJson(e)).toList();
  }
}