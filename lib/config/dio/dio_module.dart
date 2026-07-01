import 'package:dio/dio.dart';
import 'package:elevate_cycle6/core/constants/endpoints.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
