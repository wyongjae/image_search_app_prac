import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/model/photo/photo.dart';

class PhotoJsonData {
  Future<List<Photo>> fetchApi(String query) async {
    const baseUrl = 'https://pixabay.com/api/';
    const myKey = '32914845-e8ba3b79c1df4a533f0111dae';

    final url = Uri.parse('$baseUrl?key=$myKey&q=$query&image_type=photo');
    final response = await http.get(url);

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits= jsonResponse['hits'];

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
