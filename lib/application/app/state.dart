part of 'cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required bool seenIntro,
  }) = _Default;
}
