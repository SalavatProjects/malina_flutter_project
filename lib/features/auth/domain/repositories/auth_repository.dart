import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> getUser();
  Future<void> saveUser(UserEntity user);

  Future<UserEntity> register({required String email, required String password});
  Future<UserEntity?> login({required String email, required String password});
}