import 'dart:convert';
import 'dart:developer';

import 'package:elevate_cycle6/config/firebase/firestore_module.dart';
import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle6/features/home/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

/// Demo helper: fills the Firestore `products` collection with sample
/// [ProductDTO]s. Safe to call on every launch, it does nothing when the
/// collection already has data.
@lazySingleton
class ProductsSeeder {
  ProductsSeeder(this._firestore);
  final FirestoreService _firestore;

  static const _collection = 'products';
  static const _menCategoryId = '6439d5b90049ad0b52b90048';
  static const _womenCategoryId = '6439d58a0049ad0b52b9003f';

  Future<void> seed() async {
    try {
      final existing = await _firestore.getCollection(
        _collection,
        queryBuilder: (q) => q.limit(1),
      );
      if (existing.isNotEmpty) {
        log('ProductsSeeder: products already exist, skipping');
        return;
      }

      for (final product in _products) {
        // jsonEncode/jsonDecode turns the nested Category/Brand objects into
        // plain maps, which is what Firestore accepts.
        final data =
            jsonDecode(jsonEncode(product.toJson())) as Map<String, dynamic>;
        await _firestore.addDocument(_collection, data, id: product.id);
      }
      log('ProductsSeeder: added ${_products.length} products');
    } catch (e) {
      // e.g. Firestore rules not allowing writes yet.
      log('ProductsSeeder failed: $e');
    }
  }

  static final _men = Category(id: _menCategoryId, name: "Men's Fashion");
  static final _women = Category(id: _womenCategoryId, name: "Women's Fashion");

  static ProductDTO _product(
    int n,
    String title,
    int price,
    double rating,
    Category category,
  ) {
    final now = DateTime.now();
    return ProductDTO(
      id: 'seed_product_$n',
      datumId: 'seed_product_$n',
      title: title,
      slug: title.toLowerCase().replaceAll(' ', '-'),
      description: 'Sample description for $title.',
      price: price,
      quantity: 20,
      sold: n * 3,
      imageCover: 'https://picsum.photos/seed/elevate$n/600/600',
      images: ['https://picsum.photos/seed/elevate$n/600/600'],
      ratingsAverage: rating,
      ratingsQuantity: n * 5,
      category: category,
      brand: Brand(id: 'seed_brand', name: 'Elevate'),
      subcategory: [],
      createdAt: now,
      updatedAt: now,
    );
  }

  static final List<ProductDTO> _products = [
    _product(1, 'Classic Shirt', 450, 4.5, _men),
    _product(2, 'Denim Jacket', 1200, 4.2, _men),
    _product(3, 'Running Shoes', 1800, 4.8, _men),
    _product(4, 'Leather Belt', 300, 3.9, _men),
    _product(5, 'Summer Dress', 950, 4.6, _women),
    _product(6, 'Handbag', 1500, 4.4, _women),
    _product(7, 'High Heels', 1100, 4.1, _women),
    _product(8, 'Silk Scarf', 250, 4.7, _women),
  ];
}
