import 'package:elevate_cycle6/config/base_state/base_state.dart';
import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';

class FlavorsState {
  final BaseState<List<FlavorEntity>> flavorsState;

  FlavorsState({BaseState<List<FlavorEntity>>? flavorsState})
    : flavorsState =
          flavorsState ?? BaseState<List<FlavorEntity>>(isLoading: true);

  FlavorsState copyWith({BaseState<List<FlavorEntity>>? flavorsStateArgument}) {
    return FlavorsState(
      flavorsState: flavorsStateArgument ?? flavorsState,
    );
  }
}
