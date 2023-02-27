import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final String pictureId;

  const VideoWidget({
    Key? key, required this.pictureId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://i.vimeocdn.com/video/$pictureId.jpg'),
        ),
      ),
    );
  }
}
