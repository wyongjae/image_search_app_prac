import 'package:image_search_app_prac/data/data/post_data/post_data.dart';

class PostScreenViewModel {
  PostData data;

  PostScreenViewModel(this.data);

  Future<void> fetchData() async {
    data.fetchPost();
  }
}