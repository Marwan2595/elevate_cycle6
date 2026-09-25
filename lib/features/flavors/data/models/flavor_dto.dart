import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'flavor_dto.g.dart';

@JsonSerializable()
class FlavorDTO {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "imageCover")
  String? imageCover;
  @JsonKey(name: "ratingsAverage")
  double? ratingsAverage;

  FlavorDTO({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageCover,
    this.ratingsAverage,
  });

  FlavorEntity toDomain() {
    return FlavorEntity(
      id: id ?? "",
      name: title ?? "",
      description: description ?? "",
      price: price ?? 0,
      imageUrl: imageCover ?? "",
      rating: ratingsAverage ?? 0.0,
    );
  }

  factory FlavorDTO.fromJson(Map<String, dynamic> json) =>
      _$FlavorDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorDTOToJson(this);
}
