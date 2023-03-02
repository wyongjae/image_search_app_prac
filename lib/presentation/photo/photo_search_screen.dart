import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';
import 'package:image_search_app_prac/presentation/components/theme/change_theme_button_widget.dart';
import 'package:image_search_app_prac/presentation/components/theme/my_themes.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_view_model.dart';
import 'package:provider/provider.dart';

class PhotoSearchScreen extends StatefulWidget {
  const PhotoSearchScreen({Key? key}) : super(key: key);

  @override
  State<PhotoSearchScreen> createState() => _PhotoSearchScreenState();
}

class _PhotoSearchScreenState extends State<PhotoSearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<Loading>();
    final themeProvider = context.watch<ThemeProvider>();
    final viewModel = context.watch<PhotoSearchViewModel>();

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
                        await viewModel.fetch(_controller.text);
                        loading.setLoading(false);
                      },
                      icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: viewModel.state.photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 2
                          : 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return PhotoWidget(
                        url: viewModel.state.photos[index].previewURL,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
