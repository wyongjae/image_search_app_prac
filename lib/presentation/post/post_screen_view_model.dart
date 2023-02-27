import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/post_data_repository/post_data_repository.dart';
import 'package:image_search_app_prac/model/post.dart';

class PostScreenViewModel with ChangeNotifier {
  PostDataRepository repository;

  final bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Post> _posts = [];

  List<Post> get posts => UnmodifiableListView(_posts);

  PostScreenViewModel(this.repository);

  bool loading({bool? isLoading}) {
    return isLoading ??= this.isLoading;
  }

  Future<void> fetch() async {
    loading(isLoading: true);
    notifyListeners();

    _posts = await repository.getPosts();
    loading(isLoading: false);
    notifyListeners();
  }
}
