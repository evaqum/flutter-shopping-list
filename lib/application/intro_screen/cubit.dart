import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/preferences_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class IntroScreenCubit extends Cubit<IntroScreenState> {
  final PreferencesRepository _preferencesRepository;
  IntroScreenCubit(this._preferencesRepository)
      : super(const IntroScreenState());

  void pageChanged(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }

  void markAsSeen() {
    _preferencesRepository.introSeen = true;
  }
}
