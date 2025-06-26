// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_ui/app_ui.dart' as _i768;
import 'package:dio/dio.dart' as _i361;
import 'package:fm_template/app/bloc/app_bloc.dart' as _i761;
import 'package:fm_template/core/di/di_module.dart' as _i241;
import 'package:fm_template/features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i49;
import 'package:fm_template/features/profile/data/data_sources/profile_remote_data_source_impl.dart'
    as _i664;
import 'package:fm_template/features/profile/data/repositories/profile_repository_impl.dart'
    as _i577;
import 'package:fm_template/features/profile/domain/repositories/profile_repository.dart'
    as _i507;
import 'package:fm_template/features/profile/domain/usecases/get_profile.dart'
    as _i553;
import 'package:fm_template/features/profile/presentation/bloc/profile_bloc.dart'
    as _i134;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rest_client/rest_client.dart' as _i1030;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:storage/storage.dart' as _i431;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i431.LocalStorage>(() => registerModule.localStorage);
    gh.lazySingleton<_i431.SecureStorage>(() => registerModule.secureStorage);
    gh.lazySingleton<_i1030.AuthRestClient>(
      () => registerModule.authRestClient,
    );
    gh.lazySingleton<_i1030.UnAuthRestClient>(
      () => registerModule.unAuthRestClient,
    );
    gh.lazySingleton<_i768.AppService>(() => registerModule.appService);
    gh.lazySingleton<_i49.ProfileRemoteDataSource>(
      () => _i664.ProfileRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i507.ProfileRepository>(
      () => _i577.ProfileRepositoryImpl(gh<_i49.ProfileRemoteDataSource>()),
    );
    gh.factory<_i553.GetProfile>(
      () => _i553.GetProfile(gh<_i507.ProfileRepository>()),
    );
    gh.lazySingleton<_i761.AppBloc>(
      () => _i761.AppBloc(appService: gh<_i768.AppService>()),
    );
    gh.factory<_i134.ProfileBloc>(
      () => _i134.ProfileBloc(getProfile: gh<_i553.GetProfile>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i241.RegisterModule {}
