import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:test/test.dart';

void isProductEntityMatchDTO(ProductEntity entity, ProductDTO dto) {
  expect(entity.id, dto.id);
  expect(entity.name, dto.title! + " Product");
  expect(entity.price, dto.price);
}
