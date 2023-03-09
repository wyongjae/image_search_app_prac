import 'package:image_search_app_prac/data/data/post_data/post_data.dart';
import 'package:image_search_app_prac/domain/model/post.dart';
import 'package:image_search_app_prac/util/result.dart';

class PostDataRepository {
  final PostData postData;

  PostDataRepository(this.postData);

  Future<Result<List<Post>>> getPosts() async {
    return await postData.fetch();
  }
}
