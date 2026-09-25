import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/flavors/data/models/flavor_dto.dart';

abstract class FlavorsRemoteDataSource {
  Future<BaseResponse<List<FlavorDTO>>> getFlavors(); //abstract method
}
