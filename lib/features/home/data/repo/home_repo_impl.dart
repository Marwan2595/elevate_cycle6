import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/data/datasource/local/home_local_datasource.dart';
import 'package:elevate_cycle6/features/home/data/datasource/remote/home_remote_datasource.dart';
import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.remoteDatasource, this.localDatasource);
  final HomeRemoteDataSource remoteDatasource;
  final HomeLocalDataSource localDatasource;

  @override
  Future<BaseResponse<List<ProductEntity>>> getProducts() async {
    final BaseResponse<List<ProductDTO>> productsResponse =
        await remoteDatasource.getProducts();

    switch (productsResponse) {
      case SuccessResponse<List<ProductDTO>>():
        final List<ProductEntity> productsEntityList = productsResponse.data
            .map((dto) => dto.toDomain())
            .toList();

        return SuccessResponse<List<ProductEntity>>(productsEntityList);

      case ErrorResponse<List<ProductDTO>>():
        return ErrorResponse<List<ProductEntity>>(
          errMessage: productsResponse.errMessage,
        );
    }
  }

  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
