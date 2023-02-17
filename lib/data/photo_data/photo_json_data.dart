import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/data/photo_data/photo_data.dart';

class PhotoJsonData {
  final _photoStreamController = StreamController<List<Photo>>();
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<List<Photo>> loadPhoto(String query) async {
    await Future.delayed(const Duration(seconds: 2));
    const baseUrl = 'https://pixabay.com/api/';
    const myKey = '32914845-e8ba3b79c1df4a533f0111dae';

    final url = Uri.parse('$baseUrl?key=$myKey&q=$query&image_type=photo');
    final response = await http.get(url);

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    PhotoData photoData = PhotoData.fromJson(jsonResponse);

    return photoData.hits;
  }

  Future<void> fetch(String query) async {
    final result = await loadPhoto(query);
    _photoStreamController.add(result);
  }
}