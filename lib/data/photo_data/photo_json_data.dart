import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image_search_app_prac/data/photo_data/photo_data.dart';

class PhotoJsonData {
  Future<String> loadPhotoAsset() async {
    return await rootBundle.loadString('assets/photo.json');
  }

  Future<List<Photo>> loadPhoto() async {
    String jsonString = await loadPhotoAsset();
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

    PhotoData photoData = PhotoData.fromJson(jsonResponse);
    return photoData.hits;
  }
}