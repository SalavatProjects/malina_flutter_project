import 'package:malina_flutter_project/features/auth/data/datasources/user_local_data_source.dart';
import 'package:malina_flutter_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina_flutter_project/features/shared/data/mappers/user_mapper.dart';
import 'package:malina_flutter_project/features/shared/data/models/user_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';
import 'package:bcrypt/bcrypt.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalDataSource local;

  AuthRepositoryImpl(this.local);

  @override
  Future<UserEntity?> getUser() async {
    final UserModel? model = await local.getUser();
    return model?.toEntity();
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    await local.saveUser(user.toModel());
  }

  @override
  Future<UserEntity?> login({required String email, required String password}) async {
    final UserEntity? user = await getUser();
    if (user == null) return null;

    if (user.email != email) return null;

    final bool isValid = BCrypt.checkpw(password, user.passwordHash);

    if (!isValid) {
      final UserEntity updatedUser = user.copyWith(
        loginAttempts: user.loginAttempts + 1,
      );
      await saveUser(updatedUser);
      return null;
    }

    final UserEntity updatedUser = user.copyWith(loginAttempts: 0);
    await saveUser(updatedUser);
    return updatedUser;
  }

  @override
  Future<UserEntity> register({required String email, required String password}) async {
    final String hash = BCrypt.hashpw(password, BCrypt.gensalt());

    final UserModel userModel = await local.createUser(email: email, passwordHash: hash);

    return userModel.toEntity();
  }

}