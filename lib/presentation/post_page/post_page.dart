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
          final post = snapshot.data;

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView(
              children: [
                Card(
                  child: ListTile(
                    title: Column(
                      children: [
                        Text(post!.title),
                        Text(post.body),
                        Text('${post.id}'),
                        Text('${post.userId}'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}