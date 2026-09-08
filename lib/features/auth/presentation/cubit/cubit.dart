import 'package:elevate_cycle6/features/auth/presentation/cubit/product_model.dart';
import 'package:elevate_cycle6/features/auth/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState());

  Future<void> getProducts({bool showError = false}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (showError) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load products',
        ),
      );
    } else {
      final products = _getStaticProducts();
      emit(
        state.copyWith(
          isLoading: false,
          products: products,
          errorMessage: null,
        ),
      );
    }
  }

  List<Product> _getStaticProducts() {
    return [
      Product(
        id: 1,
        name: 'Product 1',
        price: 99.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: 2,
        name: 'Product 2',
        price: 149.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: 3,
        name: 'Product 3',
        price: 199.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: 4,
        name: 'Product 4',
        price: 249.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: 5,
        name: 'Product 5',
        price: 299.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: 6,
        name: 'Product 6',
        price: 349.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
  }
}
