// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i773.HomeApiClient>(() => _i773.HomeApiClient());
    gh.lazySingleton<_i967.GetCategoriesUseCase>(
      () => _i967.GetCategoriesUseCase(),
    );
    gh.lazySingleton<_i720.HomeLocalDataSource>(
      () => _i944.HomeLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i231.HomeRemoteDataSource>(
      () => _i305.HomeRemoteDataSourceImpl(gh<_i773.HomeApiClient>()),
    );
    gh.lazySingleton<_i280.HomeRepo>(
      () => _i1024.HomeRepoImpl(
        gh<_i231.HomeRemoteDataSource>(),
        gh<_i720.HomeLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i677.GetProductsUseCase>(
      () => _i677.GetProductsUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i77.HomeViewModel>(
      () => _i77.HomeViewModel(
        gh<_i677.GetProductsUseCase>(),
        gh<_i967.GetCategoriesUseCase>(),
      ),
    );
    return this;
  }
}
