import 'package:flutter/material.dart';
import 'package:image_search_app_prac/photo_data.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoData photoData;

  const PhotoWidget({
    Key? key,
    required this.photoData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photoData.hits[_currentIndex].previewURL),
        ),
      ),
    );
  }
}
