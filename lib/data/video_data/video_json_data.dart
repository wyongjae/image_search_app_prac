import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/data/video_data/video_data.dart';

class VideoJsonData {
  final _videoStreamController = StreamController<List<Video>>();

  Stream<List<Video>> get videoStream => _videoStreamController.stream;

  Future<List<Video>> loadVideo(String query) async {
    const baseUrl = 'https://pixabay.com/api/videos/';
    const myKey = '32914845-e8ba3b79c1df4a533f0111dae';

    final url = Uri.parse('$baseUrl?key=$myKey&q=$query');
    final response = await http.get(url);

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    VideoData videoData = VideoData.fromJson(jsonResponse);

    return videoData.video;
  }

  Future<void> fetchVideo(String query) async {
    final result = await loadVideo(query);
    _videoStreamController.add(result);
  }
}
