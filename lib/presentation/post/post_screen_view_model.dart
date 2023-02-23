import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/post_data_repository/post_data_repository.dart';
import 'package:image_search_app_prac/model/post.dart';

class PostScreenViewModel {
  PostDataRepository repository;

  PostScreenViewModel(this.repository);

  Future<void> fetchRepository() async {
    await repository.fetch();
  }

  FutureBuilder<List<Post>> buildFutureBuilder() {
    return FutureBuilder(
      future: repository.fetch(),
      builder: (context, snapshot) {
        final posts = snapshot.data ?? [];

        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final post = posts[index];
                {
                  return Card(
                    child: ListTile(
                      title: Text(post.title),
                    ),
                  );
                }
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
