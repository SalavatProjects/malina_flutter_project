import 'package:malina_flutter_project/features/shared/data/models/product_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> addProduct(ProductEntity product);
  Future<List<ProductEntity>> getAllProducts();
  Future<ProductEntity?> getProductById(String id);
}