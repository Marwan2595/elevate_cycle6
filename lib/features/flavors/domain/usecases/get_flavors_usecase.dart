import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';
import 'package:elevate_cycle6/features/flavors/domain/repo/flavors_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFlavorsUseCase {
  GetFlavorsUseCase(this.flavorsRepo);
  final FlavorsRepo flavorsRepo;

  Future<BaseResponse<List<FlavorEntity>>> call() {
    return flavorsRepo.getFlavors();
  }
}
