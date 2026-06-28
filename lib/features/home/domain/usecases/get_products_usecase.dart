import 'dart:developer';

import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/domain/repo/home_repo.dart';

class GetProductsUseCase {
  GetProductsUseCase(this.homeRepo);
  HomeRepo homeRepo;
  Future<List<ProductEntity>> call({String categoryId = ''}) {
    log(
      'getProducts called with categoryId: $categoryId',
      name: 'GetProductsUseCase',
    );
    return Future.value([]);
  }
}
