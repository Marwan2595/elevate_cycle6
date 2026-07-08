import 'dart:developer';

import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_cycle6/features/home/presentation/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase)
    : super(HomeInitialState());

  void getProducts() async {
    emit(HomeLoadingState()); // state = HomeLoadingState();
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    log('getProducts called', name: 'HomeViewModel');
    final BaseResponse<List<ProductEntity>> productsResponse =
        await getProductsUseCase(categoryId: '6439d58a0049ad0b52b9003f');
    switch (productsResponse) {
      case SuccessResponse<List<ProductEntity>>():
        final productList = productsResponse.data;
        for (var product in productList) {
          log(product.toString());
        }
        emit(
          HomeSuccessState(productList),
        ); // state = HomeSuccessState(productList);
        break;
      case ErrorResponse<List<ProductEntity>>():
        log(
          'Custom Error: ${productsResponse.errMessage}',
          name: 'HomeViewModel',
        );
        emit(
          HomeErrorState('Custom Error: ${productsResponse.errMessage}'),
        ); // state = HomeErrorState(productsResponse.errMessage);
    }
  }

  void getProducts2() async {
    emit(HomeLoadingState()); // state = HomeLoadingState();
    await Future.delayed(const Duration(seconds: 5)); // Simulate network delay
    log('getProducts called', name: 'HomeViewModel');
    final BaseResponse<List<ProductEntity>> productsResponse =
        await getProductsUseCase(categoryId: "6439d5b90049ad0b52b90048");
    switch (productsResponse) {
      case SuccessResponse<List<ProductEntity>>():
        final productList = productsResponse.data;
        for (var product in productList) {
          log(product.toString());
        }
        emit(
          HomeSuccessState(productList),
        ); // state = HomeSuccessState(productList);
        break;
      case ErrorResponse<List<ProductEntity>>():
        log(
          'Custom Error: ${productsResponse.errMessage}',
          name: 'HomeViewModel',
        );
        emit(
          HomeErrorState('Custom Error: ${productsResponse.errMessage}'),
        ); // state = HomeErrorState(productsResponse.errMessage);
    }
  }

  void getCategories() {
    log('getCategories called', name: 'HomeViewModel');
    getCategoriesUseCase();
  }
}
