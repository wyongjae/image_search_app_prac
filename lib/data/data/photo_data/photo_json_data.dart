import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/domain/model/photo/photo.dart';
import 'package:image_search_app_prac/util/result.dart';

class PhotoJsonData {
  final http.Client _client;

  PhotoJsonData(http.Client? client) : _client = (client ?? http.Client());

  Future<Result<List<Photo>>> fetchApi(String query) async {
    const baseUrl = 'https://pixabay.com/api/';
    const myKey = '32914845-e8ba3b79c1df4a533f0111dae';
    try {
      final url = Uri.parse('$baseUrl?key=$myKey&q=$query&image_type=photo');
      final response = await _client.get(url);
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];

      return Result.success(hits.map((e) => Photo.fromJson(e)).toList());
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
