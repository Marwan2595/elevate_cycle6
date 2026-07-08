// import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';

// sealed class HomeState {}

// class HomeInitialState extends HomeState {}

// class HomeLoadingState extends HomeState {}

// class HomeErrorState extends HomeState {
//   HomeErrorState(this.errorMessage);
//   final String errorMessage;
// }

// class HomeSuccessState extends HomeState {
//   HomeSuccessState(this.products);
//   final List<ProductEntity> products;

// }
import 'package:elevate_cycle6/config/base_state/base_state.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';

class HomeState {
  BaseState<List<ProductEntity>>? products1State;

  final bool isLoading2; //true
  final String errorMessage2;
  final List<ProductEntity> products2; //after 5 sec, list of products

  HomeState({
    this.products1State,
    this.isLoading2 = false,
    this.errorMessage2 = '',
    this.products2 = const [],
  }) {
    products1State =
        products1State ?? BaseState<List<ProductEntity>>(isLoading: true);
  }

  HomeState copyWith({
    BaseState<List<ProductEntity>>? products1StateArgument,
    bool? isLoading2Argument,
    String? errorMessage2Argument,
    List<ProductEntity>? products2Argument,
  }) {
    return HomeState(
      products1State: products1StateArgument ?? this.products1State,
      isLoading2: isLoading2Argument ?? this.isLoading2,
      errorMessage2: errorMessage2Argument ?? this.errorMessage2,
      products2: products2Argument ?? this.products2,
    );
  }
}
