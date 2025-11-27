import 'package:malina_flutter_project/features/shared/data/mappers/cart_item_mapper.dart';
import 'package:malina_flutter_project/features/shared/data/models/user_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';

extension UserModelToEntity on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      passwordHash: passwordHash,
      cartItems: cartItems.map((e) => e.toEntity()).toList(),
      loginAttempts: loginAttempts,
    );
  }
}

extension UserEntityToModel on UserEntity {
  UserModel toModel() {
    return UserModel(
      id: id,
      email: email,
      passwordHash: passwordHash,
      cartItems: cartItems.map((e) => e.toModel()).toList(),
      loginAttempts: loginAttempts,
    );
  }
}
