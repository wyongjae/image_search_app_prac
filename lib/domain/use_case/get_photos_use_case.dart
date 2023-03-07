import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/domain/model/photo/photo.dart';
import 'package:image_search_app_prac/util/result.dart';

class GetPhotosUseCase {
  PhotoDataRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> call(String query) async {
    final Result<List<Photo>> result = await repository.getPhotos(query);
    return result.when(
      success: (photos) {
        return Result.success(photos);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
