import 'package:elevate_cycle6/features/auth/presentation/cubit/product_model.dart';

class ProductsState {
  final bool isLoading;
  final List<Product> products;
  final String? errorMessage;

  ProductsState({
    this.isLoading = false,
    this.products = const [],
    this.errorMessage,
  });

  ProductsState copyWith({
    bool? isLoading,
    List<Product>? products,
    String? errorMessage,
  }) {
    return ProductsState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      errorMessage: errorMessage,
    );
  }
}
