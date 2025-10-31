import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/di.dart';
import '../core/api/api_service.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  String? token;

  Future<void> login(String username, String password) async {
    final api = getIt<ApiService>();
    final response = await api.login(username, password);

    if (response.statusCode == 200) {
      token = response.data['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);
      isLoggedIn = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    isLoggedIn = false;
    notifyListeners();
  }
}
