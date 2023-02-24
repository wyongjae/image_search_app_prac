import 'package:flutter/material.dart';
import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/data/data/post_data/post_data.dart';
import 'package:image_search_app_prac/data/data/task_data/task_json_data.dart';
import 'package:image_search_app_prac/data/data/thumbnail_data/thumbnail_json_data.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/data/repository/post_data_repository/post_data_repository.dart';
import 'package:image_search_app_prac/data/repository/task_data_repository/task_data_repository.dart';
import 'package:image_search_app_prac/data/repository/thumbnail_data_repository/thumbnail_data_repository.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/theme/my_themes.dart';
import 'package:image_search_app_prac/presentation/pages.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_view_model.dart';
import 'package:image_search_app_prac/presentation/post/post_screen_view_model.dart';
import 'package:image_search_app_prac/presentation/task/task_screen_view_model.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Loading()),
        ChangeNotifierProvider(
            create: (_) => PostScreenViewModel(PostDataRepository(PostData()))),
        ChangeNotifierProvider(
            create: (_) =>
                PhotoSearchViewModel(PhotoDataRepository(PhotoJsonData()))),
        ChangeNotifierProvider(
            create: (_) =>
                TaskScreenViewModel(TaskDataRepository(TaskJsonData()))),
        ChangeNotifierProvider(
            create: (_) => ThumbnailSearchViewModel(
                ThumbnailDataRepository(ThumbnailJsonData()))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: const Pages(),
      ),
    );
  }
}
