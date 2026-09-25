import 'package:elevate_cycle6/features/flavors/data/models/flavor_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flavors_response.g.dart';

@JsonSerializable()
class FlavorsResponse {
  @JsonKey(name: "results")
  int? results;
  @JsonKey(name: "data")
  List<FlavorDTO>? data;

  FlavorsResponse({this.results, this.data});

  factory FlavorsResponse.fromJson(Map<String, dynamic> json) =>
      _$FlavorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorsResponseToJson(this);
}
