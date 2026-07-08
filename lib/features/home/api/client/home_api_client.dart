import 'package:dio/dio.dart';
import 'package:elevate_cycle6/core/constants/endpoints.dart';
import 'package:elevate_cycle6/features/home/data/models/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@singleton
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(Endpoints.getProductsEndpoint)
  Future<ProductsResponse> getProducts({@Query('category') String? categoryId});
}
