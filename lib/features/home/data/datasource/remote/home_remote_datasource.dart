import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> getCategories(); //abstract method
  Future<List<ProductDTO>> getProducts(); //abstract method
}
