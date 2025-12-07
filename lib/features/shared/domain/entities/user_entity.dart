import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/cart_item_entity.dart';

part 'user_entity.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String passwordHash,
    required List<CartItemEntity> cartItems,
    required int loginAttemptsLeft,
}) = _UserEntity;
}