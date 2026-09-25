import 'dart:developer';

import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';
import 'package:elevate_cycle6/features/flavors/domain/usecases/get_flavors_usecase.dart';
import 'package:elevate_cycle6/features/flavors/presentation/view_model/flavors_events.dart';
import 'package:elevate_cycle6/features/flavors/presentation/view_model/flavors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlavorsViewModel extends Cubit<FlavorsState> {
  final GetFlavorsUseCase _getFlavorsUseCase;

  FlavorsViewModel(this._getFlavorsUseCase) : super(FlavorsState());

  // Event Mapper or Transformer
  void doEvent(FlavorsEvents event) {
    switch (event) {
      case GetFlavorsEvent():
        _getFlavors();
    }
  }

  Future<void> _getFlavors() async {
    emit(
      state.copyWith(
        flavorsStateArgument: state.flavorsState.copyWith(
          isLoading: true,
          errorMessage: '',
        ),
      ),
    );

    final BaseResponse<List<FlavorEntity>> flavorsResponse =
        await _getFlavorsUseCase();

    switch (flavorsResponse) {
      case SuccessResponse<List<FlavorEntity>>():
        emit(
          state.copyWith(
            flavorsStateArgument: state.flavorsState.copyWith(
              isLoading: false,
              data: flavorsResponse.data,
            ),
          ),
        );
      case ErrorResponse<List<FlavorEntity>>():
        log(flavorsResponse.errMessage, name: 'FlavorsViewModel');
        emit(
          state.copyWith(
            flavorsStateArgument: state.flavorsState.copyWith(
              isLoading: false,
              errorMessage: flavorsResponse.errMessage,
            ),
          ),
        );
    }
  }
}
