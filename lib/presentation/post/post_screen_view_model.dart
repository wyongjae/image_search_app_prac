import 'package:image_search_app_prac/data/repository/post_data_repository/post_data_repository.dart';

class PostScreenViewModel {
  PostDataRepository repository;

  PostScreenViewModel(this.repository);

  Future<void> fetchRepository() async {
    await repository.fetch();
  }
}
