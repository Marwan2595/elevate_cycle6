import 'dart:developer';

import 'package:elevate_cycle6/config/base_response/base_response.dart';
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
    final BaseResponse<List<ProductEntity>> productsResponse =
        await getProductsUseCase();
    switch (productsResponse) {
      case SuccessResponse<List<ProductEntity>>():
        final productList = productsResponse.data;
        for (var product in productList) {
          log(product.toString());
        }

        break;
      case ErrorResponse<List<ProductEntity>>():
        log(
          'Custom Error: ${productsResponse.errMessage}',
          name: 'HomeViewModel',
        );
    }
  }

  void getCategories() {
    log('getCategories called', name: 'HomeViewModel');
    getCategoriesUseCase();
  }
}
