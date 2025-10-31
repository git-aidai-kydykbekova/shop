import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.network(product.thumbnail, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Text(product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('\$${product.price}', style: const TextStyle(fontSize: 20, color: Colors.green)),
          const SizedBox(height: 12),
          Text(product.description),
        ],
      ),
    );
  }
}
