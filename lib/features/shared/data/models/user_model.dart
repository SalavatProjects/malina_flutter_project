import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/features/shared/data/models/cart_item_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String passwordHash,
    @Default([]) List<CartItemModel> cartItems,
    @Default(AppConstants.maxAvailableLoginAttempts) int loginAttemptsLeft,
}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}