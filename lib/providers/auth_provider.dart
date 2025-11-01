import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../core/api/api_service.dart';
import '../core/di.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = getIt<ApiService>();

  String? _token;
  bool get isLoggedIn => _token != null;
  String? get token => _token;

  Future<void> login(String username, String password) async {
    try {
      final res = await _apiService.login(username, password);
      _token = res.data['accessToken'];
      notifyListeners();
      debugPrint('Login success. Token: $_token');
    } on DioException catch (e) {
      debugPrint('Login failed: ${e.response?.data}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getProfile() async {
    if (_token == null) return null;
    final res = await _apiService.getMe(_token!);
    return res.data;
  }
}
