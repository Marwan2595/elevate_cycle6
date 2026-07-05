import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';


//Interface
abstract class HomeRepo {
  Future<List<String>> getCategories();//abstract method
  Future<BaseResponse<List<ProductEntity>>> getProducts();//abstract method
}
