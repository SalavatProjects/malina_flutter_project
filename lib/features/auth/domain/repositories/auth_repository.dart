import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> getCurrentUser();
  Future<bool> isLoggedIn();

  Future<UserEntity> register({required String email, required String password});
  Future<UserEntity?> login({required String email, required String password});

  Future<void> updateUser(UserEntity user);

  Future<void> logout();
  Future<void> deleteUser(String userId);
}