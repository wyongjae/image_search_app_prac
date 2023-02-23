import 'package:image_search_app_prac/model/post.dart';

abstract class PostDataRepository {
  Future<List<Post>> fetch();
}
