import 'package:image_search_app_prac/data/data/post_data/post_data.dart';
import 'package:image_search_app_prac/model/post.dart';

class PostDataRepository {
  PostData postData;

  PostDataRepository(this.postData);

  Future<List<Post>> getPosts() async {
    return await postData.fetch();
  }
}
