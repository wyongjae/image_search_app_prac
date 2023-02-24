import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_detail_screen.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_view_model.dart';
import 'package:provider/provider.dart';

class ThumbnailSearchScreen extends StatelessWidget {
  const ThumbnailSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThumbnailSearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '썸네일 검색 앱',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.fetch();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: viewModel.thumbnails.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final thumbnail = viewModel.thumbnails[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ThumbnailSearchDetailScreen(
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
                  ),
          ],
        ),
      ),
    );
  }
}
