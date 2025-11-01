import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerLazySingleton<Dio>(() => Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  ));

  getIt.registerLazySingleton<ApiService>(
        () => ApiService(dio: getIt<Dio>()),
  );
}
