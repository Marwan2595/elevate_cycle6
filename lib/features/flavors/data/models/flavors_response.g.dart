// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlavorsResponse _$FlavorsResponseFromJson(Map<String, dynamic> json) =>
    FlavorsResponse(
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FlavorDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FlavorsResponseToJson(FlavorsResponse instance) =>
    <String, dynamic>{'results': instance.results, 'data': instance.data};
