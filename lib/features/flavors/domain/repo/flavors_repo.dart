import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';

//Interface
abstract class FlavorsRepo {
  Future<BaseResponse<List<FlavorEntity>>> getFlavors(); //abstract method
}
