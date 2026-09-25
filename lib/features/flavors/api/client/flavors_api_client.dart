import 'package:dio/dio.dart';
import 'package:elevate_cycle6/core/constants/endpoints.dart';
import 'package:elevate_cycle6/features/flavors/data/models/flavors_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'flavors_api_client.g.dart';

@singleton
@RestApi()
abstract class FlavorsApiClient {
  @factoryMethod
  factory FlavorsApiClient(Dio dio) = _FlavorsApiClient;

  @GET(Endpoints.getProductsEndpoint)
  Future<FlavorsResponse> getFlavors({@Query('category') String? categoryId});
}
