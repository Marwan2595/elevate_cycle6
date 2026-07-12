import 'dart:developer';

import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_cycle6/features/home/presentation/view_model/home_events.dart';
import 'package:elevate_cycle6/features/home/presentation/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final GetProductsUseCase _getProductsUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;

  HomeViewModel(this._getProductsUseCase, this._getCategoriesUseCase)
    : super(HomeState());
  // Event Mapper or Transformer
  void doEvent(HomeEvents event) {
    switch (event) {
      case GetALlDataEvent():
        _getData();
        break;
      case GetProducts1Event():
        _getProducts1();
        break;
      case GetProducts2Event():
        _getProducts2();
        break;
    }
  }

  void _getData() {
    _getProducts1();
    _getProducts2();
  }

  void _getProducts1() async {
    emit(
      state.copyWith(
        products1StateArgument: state.products1State?.copyWith(isLoading: true),
      ),
    ); // loading1 = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    log('getProducts called', name: 'HomeViewModel');
    final BaseResponse<List<ProductEntity>> productsResponse =
        await _getProductsUseCase(categoryId: '6439d58a0049ad0b52b9003f');
    switch (productsResponse) {
      case SuccessResponse<List<ProductEntity>>():
        final productList = productsResponse.data;
        for (var product in productList) {
          log(product.toString());
        }
        emit(
          state.copyWith(
            products1StateArgument: state.products1State?.copyWith(
              isLoading: false,
              data: productList,
            ),
          ),
        ); // state = HomeSuccessState(productList);

        break;
      case ErrorResponse<List<ProductEntity>>():
        log(
          'Custom Error: ${productsResponse.errMessage}',
          name: 'HomeViewModel',
        );
        emit(
          state.copyWith(
            products1StateArgument: state.products1State?.copyWith(
              isLoading: false,
              errorMessage: 'Custom Error: ${productsResponse.errMessage}',
            ),
          ),
        ); // state = HomeErrorState(productsResponse.errMessage);
    }
    log(
      'isLoading 1: ${state.products1State?.isLoading}',
      name: 'HomeViewModel',
    );
  }

  void _getProducts2() async {
    emit(
      state.copyWith(isLoading2Argument: true, errorMessage2Argument: ''),
    ); // loading2 = true;
    await Future.delayed(const Duration(seconds: 5)); // Simulate network delay
    log('getProducts called', name: 'HomeViewModel');
    final BaseResponse<List<ProductEntity>> productsResponse =
        await _getProductsUseCase(categoryId: '6439d5b90049ad0b52b90048');
    switch (productsResponse) {
      case SuccessResponse<List<ProductEntity>>():
        final productList = productsResponse.data;
        for (var product in productList) {
          log(product.toString());
        }
        emit(
          state.copyWith(
            isLoading2Argument: false,
            products2Argument: productList,
          ),
        ); // state = HomeSuccessState(productList);
        break;
      case ErrorResponse<List<ProductEntity>>():
        log(
          'Custom Error: ${productsResponse.errMessage}',
          name: 'HomeViewModel',
        );
        emit(
          state.copyWith(
            isLoading2Argument: false,
            errorMessage2Argument:
                'Custom Error: ${productsResponse.errMessage}',
          ),
        ); // state = HomeErrorState(productsResponse.errMessage);
    }
  }

  void _getCategories() {
    log('getCategories edit on dev branch called', name: 'HomeViewModel');
    _getCategoriesUseCase();
  }
}
