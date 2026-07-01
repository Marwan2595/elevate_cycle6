import 'dart:developer';

import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_products_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase);

  void getProducts() async {
    log('getProducts called', name: 'HomeViewModel');
    //loading
    final List<ProductEntity> productList = await getProductsUseCase();

    for (var product in productList) {
      log(product.toString());
    }

    //success --- error
  }

  void getCategories() {
    log('getCategories called', name: 'HomeViewModel');
    getCategoriesUseCase();
  }
}
