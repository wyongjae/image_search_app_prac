import 'package:image_search_app_prac/domain/model/thumbnail.dart';
import 'package:image_search_app_prac/presentation/thumbnail/thumbnail_search_screen/thumbnail_search_view_model.dart';

class ThumbnailDetailScreenViewModel extends ThumbnailSearchViewModel {
  ThumbnailDetailScreenViewModel(super.repository);

  @override
  List<Thumbnail> thumbnails = [];

  @override
  Future<void> fetch() async {
    thumbnails = await repository.loadThumbnail();
    notifyListeners();
  }
}
