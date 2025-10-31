import '../core/api/api_service.dart';
import '../models/product.dart';
import '../core/di.dart';

class ProductRepository {
  final ApiService api = getIt<ApiService>();

  Future<List<Product>> fetchProducts() async {
    final response = await api.getProducts();
    final List items = response.data['products'] ?? [];
    return items.map((json) => Product.fromJson(json)).toList();
  }

  Future<Product> fetchProductById(int id) async {
    final response = await api.getProduct(id);
    return Product.fromJson(response.data);
  }
}
