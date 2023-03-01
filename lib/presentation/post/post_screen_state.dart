import 'package:image_search_app_prac/domain/model/post.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_screen_state.freezed.dart';

part 'post_screen_state.g.dart';

@freezed
class PostScreenState with _$PostScreenState {
  factory PostScreenState({
    @Default(false) bool isLoading,
    @Default([]) List<Post> posts,
  }) = _PostScreenState;

  factory PostScreenState.fromJson(Map<String, dynamic> json) => _$PostScreenStateFromJson(json);
}