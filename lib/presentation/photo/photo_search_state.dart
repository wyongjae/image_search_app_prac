import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app_prac/domain/model/photo/photo.dart';
import 'package:image_search_app_prac/util/result.dart';

part 'photo_search_state.freezed.dart';

part 'photo_search_state.g.dart';

@freezed
class PhotoSearchState with _$PhotoSearchState {
  factory PhotoSearchState({
    @Default(false) bool isLoading,
    @Default([]) Result<List<Photo>> photos,
  }) = _PhotoSearchState;

  factory PhotoSearchState.fromJson(Map<String, dynamic> json) =>
      _$PhotoSearchStateFromJson(json);
}
