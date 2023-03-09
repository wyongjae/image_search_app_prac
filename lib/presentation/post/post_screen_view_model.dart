import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/post_data_repository/post_data_repository.dart';
import 'package:image_search_app_prac/presentation/post/post_screen_state.dart';
import 'package:image_search_app_prac/util/result.dart';

class PostScreenViewModel with ChangeNotifier {
  PostDataRepository repository;

  var _state = PostScreenState();

  PostScreenState get state => _state;

  PostScreenViewModel(this.repository);

  Future<void> fetch() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await repository.getPosts();

    result.when(
      success: (posts) {
        return Result.success(
          _state = state.copyWith(
            isLoading: false,
            posts: posts,
          ),
        );
      },
      error: (message) {
        return Result.error(message);
      },
    );

    notifyListeners();
  }
}
