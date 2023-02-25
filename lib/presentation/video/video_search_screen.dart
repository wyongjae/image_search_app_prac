import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/video_widget.dart';
import 'package:image_search_app_prac/presentation/video/video_search_detail_screen.dart';
import 'package:image_search_app_prac/presentation/video/video_search_view_model.dart';
import 'package:provider/provider.dart';

class VideoSearchScreen extends StatefulWidget {
  const VideoSearchScreen({Key? key}) : super(key: key);

  @override
  State<VideoSearchScreen> createState() => _VideoSearchScreenState();
}

class _VideoSearchScreenState extends State<VideoSearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<Loading>();
    final viewModel = context.watch<VideoSearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Search Page'),
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
                      viewModel.fetch(_controller.text);
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
                  itemCount: viewModel.videos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final video = viewModel.videos[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VideoSearchDetailScreen(video: video)),
                          );
                        },
                        child: VideoWidget(
                          pictureId: video.pictureId,
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
