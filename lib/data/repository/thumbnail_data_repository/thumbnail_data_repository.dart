import 'package:image_search_app_prac/model/thumbnail.dart';

abstract class ThumbnailDataRepository {
  Future<List<Thumbnail>> loadThumbnail();
}
