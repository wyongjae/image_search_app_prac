import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image_search_app_prac/photo_data.dart';

class JsonData {
  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/photo.json');
  }

  Future<Iterable> loadPhoto() async {
    String jsonString = await _loadAStudentAsset();
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

    PhotoData photoData = PhotoData.fromJson(jsonResponse);

    return photoData.hits;
  }
}