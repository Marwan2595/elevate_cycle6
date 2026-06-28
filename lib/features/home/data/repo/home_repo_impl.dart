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
  Future<List<ProductEntity>> getProducts() async {
    //check for internet connection X
    //make function call from datasource
    //2 cases (success, error) X
    //cache productDto list X
    //convert dto list to entity list
    //return products entity list

    final List<ProductDTO> productsDTOList = await remoteDatasource
        .getProducts();
    final List<ProductEntity> productsEntityList = productsDTOList
        .map((dto) => dto.toDomain())
        .toList();

    return productsEntityList;
  }

  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
