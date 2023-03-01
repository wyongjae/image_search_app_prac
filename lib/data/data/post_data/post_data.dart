import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/domain/model/post.dart';

class PostData {
  Future<List<Post>> fetch() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
