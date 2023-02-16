import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/photo_page/photo_search_page.dart';
import 'package:image_search_app_prac/presentation/post_page/post_page.dart';
import 'package:image_search_app_prac/presentation/task/task_page.dart';
import 'package:image_search_app_prac/presentation/thumbnail_page/thumbnail_search_page.dart';

class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotoSearchPage(),
                    ),
                  );
                },
                child: const Text('Photo Search Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThumbnailSearchPage(),
                    ),
                  );
                },
                child: const Text('Thumbnail Search Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const TaskPage(),
                    ),
                  );
                },
                child: const Text('Task Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const PostPage(),
                    ),
                  );
                },
                child: const Text('Post Page')),
          ],
        ),
      ),
    );
  }
}
