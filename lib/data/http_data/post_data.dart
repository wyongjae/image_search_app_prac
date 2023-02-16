import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/data/http_data/post.dart';

class PostData {
  Future<Post> fetchPost() async {
    final uri = Uri.https('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonResponse = Post.fromJson(jsonDecode(response.body));
      return jsonResponse;
    } else {
      throw Exception('Failed to load post');
    }
  }
}