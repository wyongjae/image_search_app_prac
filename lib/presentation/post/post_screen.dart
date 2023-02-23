import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/data/post_data/post_data.dart';
import 'package:image_search_app_prac/presentation/post/post_screen_view_model.dart';

class PostScreen extends StatelessWidget {
  final PostScreenViewModel viewModel;

  const PostScreen({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Page'),
      ),
      body: FutureBuilder(
        future: viewModel.data.fetchPost(),
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
      ),
    );
  }
}
