import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/core/constants/ui_strings.dart';
import 'package:elevate_cycle6/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = getIt.get<HomeViewModel>();
    viewModel.getProducts();
    viewModel.getCategories();
    return const Scaffold(body: Center(child: Text(UiStrings.appName)));
  }
}

//Api Call (Retrofit --> ApiClient)
//Handle Success/Error in Api (Globally)
//Handle State (Multiple Api calls) (Globally)
//Dependency Injection DONE
