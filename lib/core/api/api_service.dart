import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> login(String username, String password) async {
    return dio.post('/auth/login', data: {
      'username': username,
      'password': password,
      'expiresInMins': 30,
    });
  }

  Future<Response> getMe(String accessToken) async {
    return dio.get(
      '/auth/me',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
  }

  Future<Response> getProducts() async {
    return dio.get('/products');
  }

  Future<Response> getProduct(int id) async {
    return dio.get('/products/$id');
  }
}
