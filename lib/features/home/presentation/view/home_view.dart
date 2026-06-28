import 'package:elevate_cycle6/core/constants/ui_strings.dart';
import 'package:elevate_cycle6/features/home/api/client/home_api_client.dart';
import 'package:elevate_cycle6/features/home/api/datasource/local/home_local_datasource_impl.dart';
import 'package:elevate_cycle6/features/home/api/datasource/remote/home_remote_datasource_impl.dart';
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
      GetProductsUseCase(
        HomeRepoImpl(
          HomeRemoteDataSourceImpl(HomeApiClient()),
          HomeLocalDataSourceImpl(),
        ),
      ),
      GetCategoriesUseCase(),
    );
    viewModel.getProducts();
    viewModel.getCategories();
    return const Scaffold(body: Center(child: Text(UiStrings.appName)));
  }
}

//Api Call (Retrofit --> ApiClient)
//Handle Success/Error in Api (Globally)
//Handle State (Multiple Api calls) (Globally)
//Dependency Injection
