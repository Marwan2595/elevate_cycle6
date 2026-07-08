import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  HomeErrorState(this.errorMessage);
  final String errorMessage;
}

class HomeSuccessState extends HomeState {
  HomeSuccessState(this.products);
  final List<ProductEntity> products;

}
