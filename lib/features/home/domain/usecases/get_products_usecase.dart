import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductsUseCase {
  GetProductsUseCase(this.homeRepo);
  HomeRepo homeRepo;
  Future<BaseResponse<List<ProductEntity>>> call({
    String categoryId = '',
  }) async {
    final BaseResponse<List<ProductEntity>> productsList = await homeRepo
        .getProducts(categoryId: categoryId);
    return productsList;
  }
}
