// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  passwordHash: json['passwordHash'] as String,
  cartItems:
      (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  loginAttemptsLeft:
      (json['loginAttemptsLeft'] as num?)?.toInt() ??
      AppConstants.maxAvailableLoginAttempts,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'passwordHash': instance.passwordHash,
      'cartItems': instance.cartItems,
      'loginAttemptsLeft': instance.loginAttemptsLeft,
    };
