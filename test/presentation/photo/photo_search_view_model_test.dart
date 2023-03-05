import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/data/repository/photo_data_repository/photo_data_repository.dart';
import 'package:image_search_app_prac/presentation/photo/photo_search_view_model.dart';

import '../../data/data/photo_data/photo_json_data_test.dart';

void main() {
  test('repository 에서 데이터를 가져온다', () async {
    final viewModel =
        PhotoSearchViewModel(PhotoDataRepository(PhotoJsonData(mockClient)));

    await viewModel.fetch('apple');

    expect(viewModel.state.photos.first.id, 634572);
  });
}
