import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';

class PhotoSearchViewModel {
  PhotoDataRepository repository;

  PhotoSearchViewModel(this.repository);

  Future<void> fetchRepository(String query) async {
    repository.fetchPhoto(query);
  }
}
