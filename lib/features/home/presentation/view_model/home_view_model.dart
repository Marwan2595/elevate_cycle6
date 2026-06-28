import 'dart:developer';

import 'package:elevate_cycle6/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_products_usecase.dart';

class HomeViewModel {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase);

  void getProducts() {
    log('getProducts called', name: 'HomeViewModel');
    //loading
    getProductsUseCase();
    //success --- error
  }

  void getCategories() {
    log('getCategories called', name: 'HomeViewModel');
    getCategoriesUseCase();
  }
}
