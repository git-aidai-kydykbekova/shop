import 'package:flutter/cupertino.dart';

import '../core/api/api_service.dart';
import '../core/di.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  bool loading = false;

  Future<void> fetchProducts() async {
    loading = true;
    notifyListeners();
    final api = getIt<ApiService>();
    final response = await api.getProducts();
    final List items = response.data['products'] ?? [];
    products = items.map((json) => Product.fromJson(json)).toList();
    loading = false;
    notifyListeners();
  }
}
