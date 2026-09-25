import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/flavors/api/client/flavors_api_client.dart';
import 'package:elevate_cycle6/features/flavors/data/datasource/remote/flavors_remote_datasource.dart';
import 'package:elevate_cycle6/features/flavors/data/models/flavor_dto.dart';
import 'package:elevate_cycle6/features/flavors/data/models/flavors_response.dart';
import 'package:elevate_cycle6/flavors.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FlavorsRemoteDataSource)
class FlavorsRemoteDataSourceImpl implements FlavorsRemoteDataSource {
  FlavorsRemoteDataSourceImpl(this.flavorsApiClient);
  final FlavorsApiClient flavorsApiClient;

  @override
  Future<BaseResponse<List<FlavorDTO>>> getFlavors() async {
    try {
      final FlavorsResponse flavorsResponse = await flavorsApiClient
          .getFlavors(categoryId: Flavor.productsCategoryID);
      return SuccessResponse<List<FlavorDTO>>(flavorsResponse.data ?? []);
    } on Exception catch (e) {
      return ErrorResponse<List<FlavorDTO>>(error: e);
    }
  }
}
