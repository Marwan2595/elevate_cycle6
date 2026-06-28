import 'package:elevate_cycle6/features/home/api/client/home_api_client.dart';
import 'package:elevate_cycle6/features/home/data/datasource/remote/home_remote_datasource.dart';
import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.homeApiClient);
  final HomeApiClient homeApiClient;

  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<ProductDTO>> getProducts() async {
    final productDtoList = await homeApiClient.getProduct();
    return productDtoList;
  }
}
