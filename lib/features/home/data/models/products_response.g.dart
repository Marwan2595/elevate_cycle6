// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      results: (json['results'] as num?)?.toInt(),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  nextPage: (json['nextPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
  'nextPage': instance.nextPage,
};
