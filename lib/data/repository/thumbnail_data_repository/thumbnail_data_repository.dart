import 'package:image_search_app_prac/data/data/thumbnail_data/thumbnail_json_data.dart';
import 'package:image_search_app_prac/model/thumbnail.dart';

class ThumbnailDataRepository {
  ThumbnailJsonData data;

  ThumbnailDataRepository(this.data);

  Future<List<Thumbnail>> loadThumbnail() async {
    return data.loadThumbnail();
  }
}
