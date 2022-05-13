import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PreferencesRepository {
  final SharedPreferences _sharedPreferences;

  const PreferencesRepository(this._sharedPreferences);

  static const _introSeenKey = 'intro_seen';
  static const _introSeenDefault = false;
  bool get introSeen {
    bool? b = _sharedPreferences.getBool(_introSeenKey);
    log('che');
    if (b == null) {
      log('blya');
      return introSeen = _introSeenDefault;
    }

    return b;
  }

  set introSeen(bool introSeen) =>
      _sharedPreferences.setBool(_introSeenKey, introSeen);
}
