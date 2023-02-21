import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/photo_data/photo_data.dart';
import 'package:image_search_app_prac/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';
import 'package:image_search_app_prac/presentation/components/theme/change_theme_button_widget.dart';
import 'package:image_search_app_prac/presentation/components/theme/my_themes.dart';
import 'package:provider/provider.dart';

class PhotoSearchPage extends StatefulWidget {
  final PhotoJsonData data;

  const PhotoSearchPage({Key? key, required this.data}) : super(key: key);

  @override
  State<PhotoSearchPage> createState() => _PhotoSearchPageState();
}

class _PhotoSearchPageState extends State<PhotoSearchPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = context.watch()<Loading>(context);
    final themeProvider = context.watch()<ThemeProvider>(context);


    return MaterialApp(
      themeMode: themeProvider.themeMode,
      darkTheme: MyThemes.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '이미지 검색 앱',
            textAlign: TextAlign.center,
          ),
          actions: const [
            ChangeThemeButtonWidget(),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
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
                        widget.data.fetchPhoto(_controller.text);
                        loading.setLoading(false);
                      },
                      icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              StreamBuilder<List<Photo>>(
                  initialData: const [],
                  stream: widget.data.photoStream,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    }

                    final photos = snapshot.data!;

                    return Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: photos.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 2
                                    : 3,
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
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
