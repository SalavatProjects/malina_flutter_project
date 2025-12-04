import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/features/shared/data/models/product_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

extension ProductModelToEntity on ProductModel {
  ProductEntity toEntity() {
    return when(
      food: (id ,category, subcategory, name, description, price, imagePath, additivies) =>
          ProductEntity(
            id: id,
            category: ProductCategory.food,
            subcategory: subcategory,
            name: name,
            description: description,
            imagePath: imagePath,
            additives: additivies,
            price: price,
          ),
      beauty: (id, category, subcategory, name, description, price, imagePath) => ProductEntity(
        id: id,
        category: ProductCategory.beauty,
        subcategory: subcategory,
        name: name,
        description: description,
        imagePath: imagePath,
        price: price,
      ),
    );
  }
}

extension ProductEntityToModel on ProductEntity {
  ProductModel toModel() {
    switch (category) {
      case ProductCategory.food:
        return ProductModel.food(
          id: id,
          category: AppConstants.productFood,
          subcategory: subcategory,
          name: name,
          description: description,
          imagePath: imagePath,
          price: price,
        );
      case ProductCategory.beauty:
        return ProductModel.beauty(
          id: id,
          category: AppConstants.productBeauty,
          subcategory: subcategory,
          name: name,
          description: description,
          imagePath: imagePath,
          price: price,
        );
    }
  }
}
