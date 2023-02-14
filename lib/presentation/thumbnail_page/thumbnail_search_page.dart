import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/thumbnail_data/thumbnail_data.dart';
import 'package:image_search_app_prac/data/thumbnail_data/thumbnail_json_data.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';
import 'package:image_search_app_prac/presentation/thumbnail_page/thunbnail_detail_screen.dart';

class ThumbnailSearchPage extends StatefulWidget {
  const ThumbnailSearchPage({Key? key}) : super(key: key);

  @override
  State<ThumbnailSearchPage> createState() => _ThumbnailSearchPageState();
}

class _ThumbnailSearchPageState extends State<ThumbnailSearchPage> {
  bool isLoading = false;

  final thumbnailJsonData = ThumbnailJsonData();

  List<Thumbnail> thumbnails = [];

  Future<void> delay() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    thumbnails = await thumbnailJsonData.loadThumbnail();

    setState(() {
      isLoading = false;
    });
  } // 3초간 로딩 화면 표시 후 데이터 호출

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () async {
                      await delay();
                    },
                    icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: thumbnails.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final thumbnail = thumbnails[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ThumbnailDetailScreen(
                                      thumbnails: thumbnail,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: thumbnail.id,
                                child: PhotoWidget(
                                  url: thumbnail.thumbnailUrl,
                                ),
                              ));
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
