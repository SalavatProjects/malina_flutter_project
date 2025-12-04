import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';

part 'product_entity.freezed.dart';

@freezed
sealed class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String id,
    required ProductCategory category,
    required String subcategory,
    required String name,
    required String description,
    required double price,
    String? imagePath,
    List<String>? additives,
  }) = _ProductEntity;
}
