import 'package:flutter/material.dart';
import 'package:image_search_app_prac/model/video_data.dart';
import 'package:image_search_app_prac/data/data/video_data/video_json_data.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/video_widget.dart';
import 'package:image_search_app_prac/presentation/video/video_search_detail_screen.dart';
import 'package:provider/provider.dart';

class VideoSearchScreen extends StatefulWidget {
  final VideoJsonData data;

  const VideoSearchScreen({Key? key, required this.data}) : super(key: key);

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
                      widget.data.fetchVideo(_controller.text);
                      loading.setLoading(false);
                    },
                    icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            StreamBuilder<List<Video>>(
                initialData: const [],
                stream: widget.data.videoStream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }

                  final videos = snapshot.data ?? [];

                  return Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: videos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 2
                              : 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final video = videos[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VideoSearchDetailScreen(
                                              video: video)),
                                );
                              },
                              child: VideoWidget(
                                pictureId: videos[index].pictureId,
                              ));
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
