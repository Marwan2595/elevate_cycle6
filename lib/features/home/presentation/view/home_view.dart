import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/core/constants/ui_strings.dart';
import 'package:elevate_cycle6/features/home/presentation/view_model/home_state.dart';
import 'package:elevate_cycle6/features/home/presentation/view_model/home_view_model.dart';
import 'package:elevate_cycle6/features/home/presentation/widgets/products_horizental_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = getIt.get<HomeViewModel>();

    return BlocProvider<HomeViewModel>(
      create: (context) => viewModel..getData(),
      child: Scaffold(
        appBar: AppBar(title: const Text(UiStrings.appName)),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state.products1State?.isLoading ?? false) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.products1State?.errorMessage.isNotEmpty ??
                        false) {
                      return Center(
                        child: Text(state.products1State!.errorMessage),
                      );
                    } else if (state.products1State?.data?.isNotEmpty ??
                        false) {
                      return ProductsHorizontalList(
                        title: 'Best Sellers',
                        products: state.products1State!.data!,
                        onProductTap: (product) {
                          // Handle product tap
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },

                  listener: (context, state) {
                    if (state.products1State?.errorMessage.isNotEmpty ??
                        false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Listener: " + state.products1State!.errorMessage,
                          ),
                        ),
                      );
                    }
                  },
                  listenWhen: (previous, current) {
                    if (current.products1State?.errorMessage.isNotEmpty ??
                        false) {
                      return true;
                    }
                    return false;
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading2) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.errorMessage2.isNotEmpty) {
                      return Center(child: Text(state.errorMessage2));
                    } else if (state.products2.isNotEmpty) {
                      return ProductsHorizontalList(
                        title: 'Best Sellers',
                        products: state.products2,
                        onProductTap: (product) {
                          // Handle product tap
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Api Call (Retrofit --> ApiClient) (DONE)
//Handle Success/Error in Api (Globally)
//Handle State Cubit (Multiple Api calls) (Globally)
//Dependency Injection DONE

//Api Call (Retrofit --> ApiClient) (DONE)
//Handle Success/Error in Api (Globally)
//Handle State Cubit (Multiple Api calls) (Globally)
//Dependency Injection DONE



//BlocProvider


//BlocBuilder. UI Rebuilds that depends on state changes---> buildWhen (previous state, current state)
//BlocListener. logic (snackbar, dialog, navigation, logging errors, any action that needs context) that depends on state changes


//BlocConsumer

// women 6439d58a0049ad0b52b9003f
//men 6439d5b90049ad0b52b90048