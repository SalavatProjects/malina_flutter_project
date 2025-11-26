import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:malina_flutter_project/core/common/constants/app_constants.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@Freezed(unionKey: 'type')
sealed class ProductModel with _$ProductModel {
  const factory ProductModel.food({
    required int id,
    @Default(AppConstants.productFood) String category,
    required String subcategory,
    required String name,
    required double price,
    String? imagePath,
    @Default([]) List<String> additivies,
}) = FoodProductModel;

  const factory ProductModel.beauty({
    required int id,
    @Default(AppConstants.productBeauty) String category,
    required String subcategory,
    required String name,
    required double price,
    String? imagePath,
}) = BeautyProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}