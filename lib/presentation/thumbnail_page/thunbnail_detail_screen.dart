import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/thumbnail_data/thumbnail_data.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';

class ThumbnailDetailScreen extends StatelessWidget {
  final Thumbnail thumbnails;

  const ThumbnailDetailScreen({super.key, required this.thumbnails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                  tag: thumbnails.url, child: PhotoWidget(url: thumbnails.url)),
            ),
            Text(
              thumbnails.title,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
