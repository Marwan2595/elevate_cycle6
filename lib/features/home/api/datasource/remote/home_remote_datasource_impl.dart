import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/api/client/home_api_client.dart';
import 'package:elevate_cycle6/features/home/data/datasource/remote/home_remote_datasource.dart';
import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle6/features/home/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.homeApiClient);
  final HomeApiClient homeApiClient;

  @override
  Future<List<String>> getCategories() {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<ProductDTO>>> getProducts() async {
  
    try {
       ProductsResponse productsResponse = await homeApiClient
          .getProducts();
      return SuccessResponse<List<ProductDTO>>(productsResponse.data ?? []);
    } on Exception catch (e) {
      return ErrorResponse<List<ProductDTO>>(error:e);
    }
  }
}
