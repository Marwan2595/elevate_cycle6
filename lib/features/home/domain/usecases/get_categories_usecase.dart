import 'dart:developer';

import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategoriesUseCase {
  void call() {
    log('getCategories called', name: 'GetCategoriesUseCase');
  }
}
