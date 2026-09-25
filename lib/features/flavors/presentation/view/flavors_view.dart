import 'dart:io';

import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/features/flavors/presentation/view_model/flavors_events.dart';
import 'package:elevate_cycle6/features/flavors/presentation/view_model/flavors_state.dart';
import 'package:elevate_cycle6/features/flavors/presentation/view_model/flavors_view_model.dart';
import 'package:elevate_cycle6/features/flavors/presentation/widgets/flavors_grid_view.dart';
import 'package:elevate_cycle6/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlavorsView extends StatelessWidget {
  const FlavorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlavorsViewModel>(
      create: (context) =>
          getIt.get<FlavorsViewModel>()..doEvent(GetFlavorsEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text(Flavor.appName)),
        body: SafeArea(
          child: BlocBuilder<FlavorsViewModel, FlavorsState>(
            builder: (context, state) {
              final flavorsState = state.flavorsState;
              if (flavorsState.isLoading) {
                return Center(
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                );
              } else if (flavorsState.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(flavorsState.errorMessage),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => context
                            .read<FlavorsViewModel>()
                            .doEvent(GetFlavorsEvent()),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              } else if (flavorsState.data?.isNotEmpty ?? false) {
                return FlavorsGridView(
                  flavors: flavorsState.data!,
                  onFlavorTap: (flavor) {
                    // Handle flavor tap
                  },
                );
              } else {
                return const Center(child: Text('No flavors found'));
              }
            },
          ),
        ),
      ),
    );
  }
}
