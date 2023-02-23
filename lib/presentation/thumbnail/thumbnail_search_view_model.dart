import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/repository/thumbnail_data_repository/thumbnail_data_repository.dart';
import 'package:image_search_app_prac/model/thumbnail.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_detail_screen.dart';

class ThumbnailSearchViewModel {
  ThumbnailDataRepository repository;

  ThumbnailSearchViewModel(this.repository);

  FutureBuilder<List<Thumbnail>> buildFutureBuilder() {
    return FutureBuilder(
        future: repository.loadThumbnail(),
        builder: (context, snapshot) {
          final photos = snapshot.data ?? [];

          print('Future Thread');

          if (snapshot.connectionState == ConnectionState.done) {
            return Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final thumbnail = photos[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThumbnailSearchDetailScreen(
                                thumbnail: thumbnail,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: thumbnail.url,
                          child: PhotoWidget(
                            url: thumbnail.thumbnailUrl,
                          ),
                        ));
                  }),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
