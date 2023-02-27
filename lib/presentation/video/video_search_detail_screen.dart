import 'package:flutter/material.dart';
import 'package:image_search_app_prac/model/video_data.dart';
import 'package:video_player/video_player.dart';

class VideoSearchDetailScreen extends StatefulWidget {
  final Video video;

  const VideoSearchDetailScreen({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  State<VideoSearchDetailScreen> createState() =>
      _VideoSearchDetailScreenState();
}

class _VideoSearchDetailScreenState extends State<VideoSearchDetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller =
        VideoPlayerController.network(widget.video.videoSize.medium.url)
          ..initialize().then((_) {
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Detail Screen'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller))
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
