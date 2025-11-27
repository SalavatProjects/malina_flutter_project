import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_entity.freezed.dart';

@freezed
sealed class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required int productId,
    required int quantity,
}) = _CartItemEntity;
}