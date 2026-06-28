import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override

  Future<List<ProductEntity>> getProducts() async {
    return Future.value([]);
  }

  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
