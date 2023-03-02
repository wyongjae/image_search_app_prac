import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';

void main() {
  test('photo json data 를 가져온다', () async {
    final jsonData = PhotoJsonData();

    final result = await jsonData.fetchApi('apple');

    expect(result.first.id, 634572);
  });
}
