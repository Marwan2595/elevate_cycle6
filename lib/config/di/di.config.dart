// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/flavors/api/client/flavors_api_client.dart' as _i252;
import '../../features/flavors/api/datasource/local/flavors_local_datasource_impl.dart'
    as _i100;
import '../../features/flavors/api/datasource/remote/flavors_remote_datasource_impl.dart'
    as _i574;
import '../../features/flavors/data/datasource/local/flavors_local_datasource.dart'
    as _i177;
import '../../features/flavors/data/datasource/remote/flavors_remote_datasource.dart'
    as _i1054;
import '../../features/flavors/data/repo/flavors_repo_impl.dart' as _i259;
import '../../features/flavors/domain/repo/flavors_repo.dart' as _i710;
import '../../features/flavors/domain/usecases/get_flavors_usecase.dart'
    as _i687;
import '../../features/flavors/presentation/view_model/flavors_view_model.dart'
    as _i15;
import '../../features/home/api/client/home_api_client.dart' as _i773;
import '../../features/home/api/datasource/local/home_local_datasource_impl.dart'
    as _i944;
import '../../features/home/api/datasource/remote/home_remote_datasource_impl.dart'
    as _i305;
import '../../features/home/data/datasource/local/home_local_datasource.dart'
    as _i720;
import '../../features/home/data/datasource/remote/home_remote_datasource.dart'
    as _i231;
import '../../features/home/data/repo/home_repo_impl.dart' as _i1024;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i967;
import '../../features/home/domain/usecases/get_products_usecase.dart' as _i677;
import '../../features/home/presentation/view_model/home_view_model.dart'
    as _i77;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i967.GetCategoriesUseCase>(
      () => _i967.GetCategoriesUseCase(),
    );
    gh.lazySingleton<_i177.FlavorsLocalDataSource>(
      () => _i100.FlavorsLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i720.HomeLocalDataSource>(
      () => _i944.HomeLocalDataSourceImpl(),
    );
    gh.singleton<_i252.FlavorsApiClient>(
      () => _i252.FlavorsApiClient(gh<_i361.Dio>()),
    );
    gh.singleton<_i773.HomeApiClient>(
      () => _i773.HomeApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i231.HomeRemoteDataSource>(
      () => _i305.HomeRemoteDataSourceImpl(gh<_i773.HomeApiClient>()),
    );
    gh.lazySingleton<_i1054.FlavorsRemoteDataSource>(
      () => _i574.FlavorsRemoteDataSourceImpl(gh<_i252.FlavorsApiClient>()),
    );
    gh.lazySingleton<_i280.HomeRepo>(
      () => _i1024.HomeRepoImpl(
        gh<_i231.HomeRemoteDataSource>(),
        gh<_i720.HomeLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i710.FlavorsRepo>(
      () => _i259.FlavorsRepoImpl(
        gh<_i1054.FlavorsRemoteDataSource>(),
        gh<_i177.FlavorsLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i677.GetProductsUseCase>(
      () => _i677.GetProductsUseCase(gh<_i280.HomeRepo>()),
    );
    gh.lazySingleton<_i687.GetFlavorsUseCase>(
      () => _i687.GetFlavorsUseCase(gh<_i710.FlavorsRepo>()),
    );
    gh.factory<_i77.HomeViewModel>(
      () => _i77.HomeViewModel(
        gh<_i677.GetProductsUseCase>(),
        gh<_i967.GetCategoriesUseCase>(),
      ),
    );
    gh.factory<_i15.FlavorsViewModel>(
      () => _i15.FlavorsViewModel(gh<_i687.GetFlavorsUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
