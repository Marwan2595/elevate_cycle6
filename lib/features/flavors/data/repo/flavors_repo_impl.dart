import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/flavors/data/datasource/local/flavors_local_datasource.dart';
import 'package:elevate_cycle6/features/flavors/data/datasource/remote/flavors_remote_datasource.dart';
import 'package:elevate_cycle6/features/flavors/data/models/flavor_dto.dart';
import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';
import 'package:elevate_cycle6/features/flavors/domain/repo/flavors_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FlavorsRepo)
class FlavorsRepoImpl implements FlavorsRepo {
  FlavorsRepoImpl(this.remoteDatasource, this.localDatasource);
  final FlavorsRemoteDataSource remoteDatasource;
  final FlavorsLocalDataSource localDatasource;

  @override
  Future<BaseResponse<List<FlavorEntity>>> getFlavors() async {
    final BaseResponse<List<FlavorDTO>> flavorsResponse =
        await remoteDatasource.getFlavors();

    switch (flavorsResponse) {
      case SuccessResponse<List<FlavorDTO>>():
        final List<FlavorEntity> flavorsEntityList = flavorsResponse.data
            .map((dto) => dto.toDomain())
            .toList();

        return SuccessResponse<List<FlavorEntity>>(flavorsEntityList);

      case ErrorResponse<List<FlavorDTO>>():
        return ErrorResponse<List<FlavorEntity>>(
          errMessage: flavorsResponse.errMessage,
        );
    }
  }
}
