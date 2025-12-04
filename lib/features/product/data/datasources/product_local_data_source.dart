import 'dart:convert';
import 'package:malina_flutter_project/features/shared/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class ProductLocalDataSource {
  static const String _key = "products_list";

  final SharedPreferences prefs;

  ProductLocalDataSource(this.prefs);

  Future<List<ProductModel>> getProducts() async {
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];

    final List<dynamic> productList = json.decode(jsonString);
    return productList.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> _saveProducts(List<ProductModel> products) async {
    final jsonString = json.encode(products.map((e) => e.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }

  Future<void> addProduct(ProductModel product) async {
    final List<ProductModel> productsList = await getProducts();
    productsList.add(product);
    await _saveProducts(productsList);
  }

  Future<ProductModel?> getProductById(String id) async {
    final List<ProductModel> productsList = await getProducts();
    return productsList.firstWhereOrNull((e) => e.id == id);
  }
}