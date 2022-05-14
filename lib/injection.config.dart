// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'application/app/cubit.dart' as _i8;
import 'application/injection_module.dart' as _i10;
import 'application/intro_screen/cubit.dart' as _i9;
import 'application/lists_overview_screen/cubit.dart' as _i5;
import 'application/new_list_sheet/cubit.dart' as _i6;
import 'data/preferences_repository.dart' as _i7;
import 'data/shopping_list_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
      () => injectionModule.sharedPreferences,
      preResolve: true);
  gh.singleton<_i4.ShoppingListRepository>(_i4.ShoppingListRepository());
  gh.factory<_i5.ListsOverviewScreenCubit>(
      () => _i5.ListsOverviewScreenCubit(get<_i4.ShoppingListRepository>()));
  gh.factory<_i6.NewListSheetCubit>(
      () => _i6.NewListSheetCubit(get<_i4.ShoppingListRepository>()));
  gh.singleton<_i7.PreferencesRepository>(
      _i7.PreferencesRepository(get<_i3.SharedPreferences>()));
  gh.factory<_i8.AppCubit>(
      () => _i8.AppCubit(get<_i7.PreferencesRepository>()));
  gh.factory<_i9.IntroScreenCubit>(
      () => _i9.IntroScreenCubit(get<_i7.PreferencesRepository>()));
  return get;
}

class _$InjectionModule extends _i10.InjectionModule {}
