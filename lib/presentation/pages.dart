import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/data/video_data/video_json_data.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_screen.dart';
import 'package:image_search_app_prac/presentation/post/post_screen.dart';
import 'package:image_search_app_prac/presentation/task/task_screen.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_screen/thumbnail_search_screen.dart';
import 'package:image_search_app_prac/presentation/video/video_search_screen.dart';

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
                      builder: (context) => const PhotoSearchScreen(),
                    ),
                  );
                },
                child: const Text('Photo Search Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThumbnailSearchScreen(),
                    ),
                  );
                },
                child: const Text('Thumbnail Search Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskScreen(),
                    ),
                  );
                },
                child: const Text('Task Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostScreen(),
                    ),
                  );
                },
                child: const Text('Post Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoSearchScreen(data: VideoJsonData()),
                    ),
                  );
                },
                child: const Text('Video Search Page')),
          ],
        ),
      ),
    );
  }
}
