import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';
import 'package:elevate_cycle6/features/flavors/presentation/widgets/flavor_card.dart';
import 'package:flutter/material.dart';

class FlavorsGridView extends StatelessWidget {
  const FlavorsGridView({super.key, required this.flavors, this.onFlavorTap});

  final List<FlavorEntity> flavors;
  final ValueChanged<FlavorEntity>? onFlavorTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: flavors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final flavor = flavors[index];
        return FlavorCard(
          flavor: flavor,
          onTap: onFlavorTap == null ? null : () => onFlavorTap!(flavor),
        );
      },
    );
  }
}
