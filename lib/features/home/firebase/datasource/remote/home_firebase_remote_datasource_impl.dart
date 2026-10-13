import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/config/firebase/firestore_module.dart';
import 'package:elevate_cycle6/config/firebase/storage_module.dart';
import 'package:elevate_cycle6/features/home/data/datasource/remote/home_remote_datasource.dart';
import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';
import 'package:injectable/injectable.dart';

/// Gets the products from Cloud Firestore (collection `products`) instead of
/// the REST api.
///
/// Expected document shape (same keys as the api response):
///   title, description, price, imageCover, ratingsAverage,
///   category: { _id, name }
@Named('firebase')
@LazySingleton(as: HomeRemoteDataSource)
class HomeFirebaseRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeFirebaseRemoteDataSourceImpl(this._firestore, this._storage);
  final FirestoreService _firestore;
  final StorageService _storage;

  static const _productsCollection = 'products';

  @override
  Future<List<String>> getCategories() {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<ProductDTO>>> getProducts({
    String categoryId = '',
  }) async {
    try {
      final docs = await _firestore.getCollection(
        _productsCollection,
        queryBuilder: (query) => categoryId.isEmpty
            ? query
            : query.where('category._id', isEqualTo: categoryId),
      );
      final products = docs.map(_toProductDto).toList();
      return SuccessResponse<List<ProductDTO>>(products);
    } on Exception catch (e) {
      return ErrorResponse<List<ProductDTO>>(error: e);
    }
  }

  /// Storage usage example: uploads [image] to Firebase Storage and returns
  /// its download url.
  Future<BaseResponse<String>> uploadImage(File image) async {
    try {
    //"65465465465465"
      final path = 'products/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final url = await _storage.uploadFile(image, path);
      return SuccessResponse<String>(url);
    } on Exception catch (e) {
      return ErrorResponse<String>(error: e);
    }
  }

  ProductDTO _toProductDto(Map<String, dynamic> doc) {
    // ProductDTO is generated for the api json: ids live under `_id`, dates
    // are ISO strings. Firestore gives `id` and Timestamp, so adapt them.
    final json = doc.map(
      (key, value) =>
          MapEntry(key, value is Timestamp ? value.toDate().toIso8601String() : value),
    );
    json['_id'] = doc['id'];
    return ProductDTO.fromJson(json);
  }
}
