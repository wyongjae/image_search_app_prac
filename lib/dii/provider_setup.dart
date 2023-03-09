import 'package:http/http.dart' as http;
import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 독립적인 객체
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  ),
];

// 3. 2번에 의존성이 있는 객체
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PhotoJsonData>(
    update: (context, client, _) => PhotoJsonData(client),
  ),
  ProxyProvider<PhotoJsonData, PhotoDataRepository>(
    update: (context, api, _) => PhotoDataRepository(api),
  ),
  ProxyProvider<PhotoDataRepository, GetPhotosUseCase>(
    update: (context, repository, _) => GetPhotosUseCase(repository),
  ),
];

// 4. ViewModels
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<PhotoSearchViewModel>(
    create: (context) => PhotoSearchViewModel(context.read<GetPhotosUseCase>()),
  ),
];
