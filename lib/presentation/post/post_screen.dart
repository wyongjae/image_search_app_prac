import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/post/post_screen_view_model.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Page'),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.fetch();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: _buildFutureBuilder(viewModel),
    );
  }

  Widget _buildFutureBuilder(PostScreenViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final posts = viewModel.posts;

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
      },
    );
  }
}
