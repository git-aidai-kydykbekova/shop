import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item['price']);
}
