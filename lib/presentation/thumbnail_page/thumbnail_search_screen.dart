import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/data/thumbnail_data/thumbnail_json_data.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';
import 'package:image_search_app_prac/presentation/thumbnail_page/thumbnail_search_detail_screen.dart';
import 'package:provider/provider.dart';

class ThumbnailSearchScreen extends StatelessWidget {
  const ThumbnailSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<Loading>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색 앱',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      loading.setLoading(true);
                    },
                    icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            FutureBuilder(
                future: ThumbnailJsonData().loadThumbnail(),
                builder: (context, snapshot) {
                  final photos = snapshot.data ?? [];

                  print('Future Thread');

                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: photos.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                    );
                  }
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
