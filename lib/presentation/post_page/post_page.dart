import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/http_data/post_data.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Page'),
      ),
      body: FutureBuilder(
        future: PostData().fetchPost(),
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