import 'package:flutter/material.dart';
import '../core/api/api_service.dart';
import '../core/di.dart';

class ProductProvider extends ChangeNotifier {
  List products = [];
  bool loading = false;

  Future<void> fetchProducts() async {
    loading = true;
    notifyListeners();
    final api = getIt<ApiService>();
    final response = await api.getProducts();
    products = response.data['products'];
    loading = false;
    notifyListeners();
  }
}
