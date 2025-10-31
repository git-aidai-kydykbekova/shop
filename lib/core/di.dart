import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'https://dummyjson.com')));
  getIt.registerLazySingleton(() => ApiService(dio: getIt<Dio>()));
}
