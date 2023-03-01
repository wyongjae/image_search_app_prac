import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/domain/model/video_data.dart';

class VideoJsonData {
  Future<List<Video>> loadVideo(String query) async {
    const baseUrl = 'https://pixabay.com/api/videos/';
    const myKey = '32914845-e8ba3b79c1df4a533f0111dae';

    final url = Uri.parse('$baseUrl?key=$myKey&q=$query');
    final response = await http.get(url);

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    VideoData videoData = VideoData.fromJson(jsonResponse);

    return videoData.video;
  }
}
