import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/post_data_repository/post_data_repository.dart';
import 'package:image_search_app_prac/model/post.dart';

class PostScreenViewModel with ChangeNotifier {
  PostDataRepository repository;

  PostScreenViewModel(this.repository);

  bool isLoading = false;

  List<Post> posts = [];

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    posts = await repository.getPosts();
    isLoading = false;
    notifyListeners();
  }
}
