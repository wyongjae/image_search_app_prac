import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_view_model.dart';
import 'package:provider/provider.dart';

class ThumbnailSearchScreen extends StatelessWidget {
  final ThumbnailSearchViewModel viewModel;

  const ThumbnailSearchScreen({Key? key, required this.viewModel})
      : super(key: key);

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
            viewModel.buildFutureBuilder(),
          ],
        ),
      ),
    );
  }
}
