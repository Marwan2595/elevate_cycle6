import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> getCategories(); //abstract method
  Future<BaseResponse<List<ProductDTO>>> getProducts(); //abstract method
}
