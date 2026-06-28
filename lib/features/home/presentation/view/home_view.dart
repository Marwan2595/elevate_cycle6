import 'package:elevate_cycle6/core/constants/ui_strings.dart';
import 'package:elevate_cycle6/features/home/data/repo/home_repo_impl.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_cycle6/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_cycle6/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel(
      GetProductsUseCase(HomeRepoImpl()),
      GetCategoriesUseCase(),
    );
    viewModel.getProducts();
    viewModel.getCategories();
    return const Scaffold(body: Center(child: Text(UiStrings.appName)));
  }
}
