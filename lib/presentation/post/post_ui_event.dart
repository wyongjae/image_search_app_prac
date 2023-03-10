import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_ui_event.freezed.dart';

@freezed
abstract class PostUiEvent<T> with _$PostUiEvent<T> {
  const factory PostUiEvent.showSnackBar(String message) = ShowSnackBar;
}