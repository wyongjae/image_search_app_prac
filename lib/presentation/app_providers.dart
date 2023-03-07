import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/data/data/post_data/post_data.dart';
import 'package:image_search_app_prac/data/data/task_data/task_json_data.dart';
import 'package:image_search_app_prac/data/data/thumbnail_data/thumbnail_json_data.dart';
import 'package:image_search_app_prac/data/data/video_data/video_json_data.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/data/repository/post_data_repository/post_data_repository.dart';
import 'package:image_search_app_prac/data/repository/task_data_repository/task_data_repository.dart';
import 'package:image_search_app_prac/data/repository/thumbnail_data_repository/thumbnail_data_repository.dart';
import 'package:image_search_app_prac/data/repository/video_data_repository/video_data_repository.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/theme/my_themes.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_view_model.dart';
import 'package:image_search_app_prac/presentation/post/post_screen_view_model.dart';
import 'package:image_search_app_prac/presentation/task/task_screen_view_model.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_detail_screen/thumbnail_detail_screen_view_model.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_screen/thumbnail_search_view_model.dart';
import 'package:image_search_app_prac/presentation/video/video_search_view_model.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Loading()),
        ChangeNotifierProvider(
            create: (_) => PostScreenViewModel(PostDataRepository(PostData()))),
        ChangeNotifierProvider(
            create: (_) => PhotoSearchViewModel(
                PhotoDataRepository(PhotoJsonData(Client())))),
        ChangeNotifierProvider(
            create: (_) =>
                TaskScreenViewModel(TaskDataRepository(TaskJsonData()))),
        ChangeNotifierProvider(
            create: (_) => ThumbnailSearchViewModel(
                ThumbnailDataRepository(ThumbnailJsonData()))),
        ChangeNotifierProvider(
            create: (_) => ThumbnailDetailScreenViewModel(
                ThumbnailDataRepository(ThumbnailJsonData()))),
        ChangeNotifierProvider(
            create: (_) =>
                VideoSearchViewModel(VideoDataRepository(VideoJsonData()))),
      ],
      child: child,
    );
  }
}
