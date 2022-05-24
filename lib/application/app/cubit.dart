import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/preferences_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  // ignore: unused_field
  final PreferencesRepository _preferencesRepository;
  AppCubit(this._preferencesRepository) : super(AppState(seenIntro: _preferencesRepository.introSeen));
}
