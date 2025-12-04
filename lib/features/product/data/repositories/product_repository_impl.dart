import 'package:malina_flutter_project/features/product/data/datasources/product_local_data_source.dart';
import 'package:malina_flutter_project/features/product/domain/repositories/product_repository.dart';
import 'package:malina_flutter_project/features/shared/data/mappers/product_mapper.dart';
import 'package:malina_flutter_project/features/shared/data/models/product_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource local;

  ProductRepositoryImpl(this.local);

  @override
  Future<void> addProduct(ProductEntity product) async {
    final model = product.toModel();
    await local.addProduct(model);
  }

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final models = await local.getProducts();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<ProductEntity?> getProductById(String id) async {
    final model = await local.getProductById(id);
    return model?.toEntity();
  }
}
