import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/photo_data/photo_data.dart';
import 'package:image_search_app_prac/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';
import 'package:provider/provider.dart';

class PhotoSearchPage extends StatefulWidget {
  const PhotoSearchPage({Key? key}) : super(key: key);

  @override
  State<PhotoSearchPage> createState() => _PhotoSearchPageState();
}

class _PhotoSearchPageState extends State<PhotoSearchPage> {
  final _controller = TextEditingController();
  final photoJsonData = PhotoJsonData();
  List<Photo> photos = [];

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
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      loading.setLoading(true);
                      photos = await photoJsonData.loadPhoto(_controller.text);
                      loading.setLoading(false);
                    },
                    icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            loading.isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: photos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                                  Orientation.portrait ? 2 : 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                print(photos[index].likes);
                              },
                              child: PhotoWidget(
                                url: photos[index].previewURL,
                              ));
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
