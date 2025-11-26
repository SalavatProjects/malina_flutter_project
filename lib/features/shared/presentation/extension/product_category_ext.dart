import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

extension ProductCategoryExt on ProductCategory {
  String get value => switch (this) {
    ProductCategory.food => AppConstants.productFood,
    ProductCategory.beauty => AppConstants.productBeauty,
  };

  String get label => switch (this) {
    ProductCategory.food => t.feed.food.name,
    ProductCategory.beauty => t.feed.beauty.name,
  };
}