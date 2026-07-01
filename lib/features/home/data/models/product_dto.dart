import 'package:elevate_cycle6/features/home/data/models/products_response.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_dto.g.dart';

@JsonSerializable()
class ProductDTO {
  @JsonKey(name: "sold")
  int? sold;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "subcategory")
  List<Subcategory>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  int? ratingsQuantity;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "imageCover")
  String? imageCover;
  @JsonKey(name: "category")
  Category? category;
  @JsonKey(name: "brand")
  Brand? brand;
  @JsonKey(name: "ratingsAverage")
  double? ratingsAverage;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "id")
  String? datumId;

  ProductDTO({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.datumId,
  });

  ProductEntity toDomain() {
    return ProductEntity(
      name: title ?? "",
      imageUrl: imageCover ?? "",
      rating: ratingsAverage ?? 0.0,
      id: id ?? "",
      description: description ?? "",
      price: price ?? 0,
      category: category?.id ?? "",
    );
  }

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}
