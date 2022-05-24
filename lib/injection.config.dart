// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'application/app/cubit.dart' as _i11;
import 'application/barcode_scan_screen/cubit.dart' as _i7;
import 'application/injection_module.dart' as _i13;
import 'application/intro_screen/cubit.dart' as _i12;
import 'application/lists_overview_screen/cubit.dart' as _i8;
import 'application/new_list_sheet/cubit.dart' as _i9;
import 'data/barcode_repository.dart' as _i6;
import 'data/preferences_repository.dart' as _i10;
import 'data/shopping_list_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.Client>(() => injectionModule.httpClient);
  await gh.factoryAsync<_i4.SharedPreferences>(
      () => injectionModule.sharedPreferences,
      preResolve: true);
  gh.singleton<_i5.ShoppingListRepository>(_i5.ShoppingListRepository(),
      dispose: (i) => i.dispose());
  gh.singleton<_i6.BarcodeRepository>(_i6.BarcodeRepository(get<_i3.Client>()));
  gh.factory<_i7.BarcodeScanScreenCubit>(
      () => _i7.BarcodeScanScreenCubit(get<_i6.BarcodeRepository>()));
  gh.factory<_i8.ListsOverviewScreenCubit>(
      () => _i8.ListsOverviewScreenCubit(get<_i5.ShoppingListRepository>()));
  gh.factory<_i9.NewListSheetCubit>(
      () => _i9.NewListSheetCubit(get<_i5.ShoppingListRepository>()));
  gh.singleton<_i10.PreferencesRepository>(
      _i10.PreferencesRepository(get<_i4.SharedPreferences>()));
  gh.factory<_i11.AppCubit>(
      () => _i11.AppCubit(get<_i10.PreferencesRepository>()));
  gh.factory<_i12.IntroScreenCubit>(
      () => _i12.IntroScreenCubit(get<_i10.PreferencesRepository>()));
  return get;
}

class _$InjectionModule extends _i13.InjectionModule {}
