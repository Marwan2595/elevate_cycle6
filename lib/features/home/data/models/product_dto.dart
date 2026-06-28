import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';

class ProductDTO {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? category;
  final double? rating;

  ProductDTO({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.category,
    this.rating,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'],
      category: json['category'],
      rating: (json['rating'] as num?)?.toDouble(),
    );
  }

  ProductEntity toDomain() {
    return ProductEntity(
      id: id ?? 0,
      name: name ?? '',
      description: description ?? '',
      price: price ?? 0.0,
      imageUrl: imageUrl ?? '',
      category: category ?? '',
      rating: rating ?? 0.0,
    );
  }
}
