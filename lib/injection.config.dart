// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import 'app/domain/repository/app_repository.dart' as _i29;
import 'app/domain/repository/app_repository_imp.dart' as _i30;
import 'app/presentation/bloc/app_bloc.dart' as _i33;
import 'core/data/base_local_data_source.dart' as _i14;
import 'core/data/base_remote_data_source.dart' as _i15;
import 'core/data/base_repository.dart' as _i16;
import 'core/network/network_info.dart' as _i7;
import 'features/login/data/data_source/local_data_source/login_local_data_source.dart'
    as _i18;
import 'features/login/data/data_source/local_data_source/login_local_data_source_imp.dart'
    as _i19;
import 'features/login/data/data_source/remote_data_source/login_remote_data_source.dart'
    as _i5;
import 'features/login/data/data_source/remote_data_source/login_remote_data_source_imp.dart'
    as _i6;
import 'features/login/data/repository/login_repository_imp.dart' as _i21;
import 'features/login/domain/repository/login_repository.dart' as _i20;
import 'features/login/domain/uase_cases/login_use_case.dart' as _i22;
import 'features/login/presentation/bloc/login_bloc.dart' as _i31;
import 'features/register/data/data_source/local_data_source/register_local_data_source.dart'
    as _i23;
import 'features/register/data/data_source/local_data_source/register_local_data_source_imp.dart'
    as _i24;
import 'features/register/data/data_source/remote_data_source/register_remote_data_source.dart'
    as _i8;
import 'features/register/data/data_source/remote_data_source/register_remote_data_source_imp.dart'
    as _i9;
import 'features/register/data/repository/register_repository_imp.dart' as _i26;
import 'features/register/domain/repository/register_repository.dart' as _i25;
import 'features/register/domain/use_cases/register_use_case.dart' as _i27;
import 'features/register/presentation/bloc/register_bloc.dart' as _i32;
import 'features/splash/data/data_source/repository/splash_repository_imp.dart'
    as _i13;
import 'features/splash/data/data_source/splash_local_data_source/splash_local_data_source.dart'
    as _i11;
import 'features/splash/data/domain/repository/splash_repository.dart' as _i12;
import 'features/splash/data/domain/use_case/check_auth_use_case.dart' as _i17;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i28;
import 'injection.dart' as _i34;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i5.LoginRemoteDataSource>(
      () => _i6.LoginRemoteDataSourceImp(dio: gh<_i3.Dio>()));
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(gh<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i8.RegisterRemoteDataSource>(
      () => _i9.RegisterRemoteDataSourceImp(dio: gh<_i3.Dio>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i11.SplashLocalDataSource>(() =>
      _i11.SplashLocalDataSourceImp(
          sharedPreferences: gh<_i10.SharedPreferences>()));
  gh.lazySingleton<_i12.SplashRepository>(() => _i13.SplashRepositoryImp(
        gh<_i11.SplashLocalDataSource>(),
        gh<_i7.NetworkInfo>(),
      ));
  gh.lazySingleton<_i14.BaseLocalDataSource>(() => _i14.BaseLocalDataSourceImp(
      sharedPreferences: gh<_i10.SharedPreferences>()));
  gh.lazySingleton<_i15.BaseRemoteDataSource>(
      () => _i15.BaseRemoteDataSourceImpl(dio: gh<_i3.Dio>()));
  gh.lazySingleton<_i16.BaseRepository>(() => _i16.BaseRepositoryImpl(
        baseLocalDataSource: gh<_i14.BaseLocalDataSource>(),
        networkInfo: gh<_i7.NetworkInfo>(),
      ));
  gh.lazySingleton<_i17.CheckAuthUseCase>(
      () => _i17.CheckAuthUseCase(gh<_i12.SplashRepository>()));
  gh.lazySingleton<_i18.LoginLocalDataSource>(() =>
      _i19.LoginLocalDataSourceImp(
          sharedPreferences: gh<_i10.SharedPreferences>()));
  gh.lazySingleton<_i20.LoginRepository>(() => _i21.LoginRepositoryImp(
        gh<_i18.LoginLocalDataSource>(),
        gh<_i5.LoginRemoteDataSource>(),
        networkInfo: gh<_i7.NetworkInfo>(),
      ));
  gh.lazySingleton<_i22.LoginUseCase>(
      () => _i22.LoginUseCase(gh<_i20.LoginRepository>()));
  gh.lazySingleton<_i23.RegisterLocalDataSource>(() =>
      _i24.RegisterLocalDataSourceImp(
          sharedPreferences: gh<_i10.SharedPreferences>()));
  gh.lazySingleton<_i25.RegisterRepository>(() => _i26.RegisterRepositoryImp(
        gh<_i23.RegisterLocalDataSource>(),
        gh<_i8.RegisterRemoteDataSource>(),
        networkInfo: gh<_i7.NetworkInfo>(),
      ));
  gh.lazySingleton<_i27.RegisterUseCase>(
      () => _i27.RegisterUseCase(gh<_i25.RegisterRepository>()));
  gh.factory<_i28.SplashBloc>(
      () => _i28.SplashBloc(gh<_i17.CheckAuthUseCase>()));
  gh.lazySingleton<_i29.AppRepository>(
      () => _i30.AppRepositoryImp(gh<_i14.BaseLocalDataSource>()));
  gh.factory<_i31.LoginBloc>(() => _i31.LoginBloc(gh<_i22.LoginUseCase>()));
  gh.factory<_i32.RegisterBloc>(
      () => _i32.RegisterBloc(gh<_i27.RegisterUseCase>()));
  gh.lazySingleton<_i33.AppBloc>(() => _i33.AppBloc(gh<_i29.AppRepository>()));
  return getIt;
}

class _$RegisterModule extends _i34.RegisterModule {}
