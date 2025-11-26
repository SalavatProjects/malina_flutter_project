// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodProductModel _$FoodProductModelFromJson(Map<String, dynamic> json) =>
    FoodProductModel(
      id: (json['id'] as num).toInt(),
      category: json['category'] as String? ?? AppConstants.productFood,
      subcategory: json['subcategory'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String?,
      additivies:
          (json['additivies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$FoodProductModelToJson(FoodProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'name': instance.name,
      'price': instance.price,
      'imagePath': instance.imagePath,
      'additivies': instance.additivies,
      'type': instance.$type,
    };

BeautyProductModel _$BeautyProductModelFromJson(Map<String, dynamic> json) =>
    BeautyProductModel(
      id: (json['id'] as num).toInt(),
      category: json['category'] as String? ?? AppConstants.productBeauty,
      subcategory: json['subcategory'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$BeautyProductModelToJson(BeautyProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'name': instance.name,
      'price': instance.price,
      'imagePath': instance.imagePath,
      'type': instance.$type,
    };
