import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/thumbnail_data/thumbnail.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';

class ThumbnailDetailScreen extends StatelessWidget {
  final Thumbnail thumbnail;

  const ThumbnailDetailScreen({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: thumbnail.url,
                child: PhotoWidget(url: thumbnail.url),
              ),
            ),
            Text(
              thumbnail.title,
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
