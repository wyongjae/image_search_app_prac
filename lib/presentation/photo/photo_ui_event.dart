import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_ui_event.freezed.dart';

@freezed
abstract class PhotoUiEvent<T> with _$PhotoUiEvent<T> {
  const factory PhotoUiEvent.showSnackBar(String message) = ShowSnackBar;
}