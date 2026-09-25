// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlavorDTO _$FlavorDTOFromJson(Map<String, dynamic> json) => FlavorDTO(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  imageCover: json['imageCover'] as String?,
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FlavorDTOToJson(FlavorDTO instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
  'imageCover': instance.imageCover,
  'ratingsAverage': instance.ratingsAverage,
};
