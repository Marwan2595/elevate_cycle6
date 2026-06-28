import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';


//Interface
abstract class HomeRepo {
  Future<List<String>> getCategories();//abstract method
  Future<List<ProductEntity>> getProducts();//abstract method
}
