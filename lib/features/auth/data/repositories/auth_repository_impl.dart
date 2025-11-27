import 'package:malina_flutter_project/core/services/id_generator.dart';
import 'package:malina_flutter_project/features/auth/data/datasources/user_local_data_source.dart';
import 'package:malina_flutter_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina_flutter_project/features/shared/data/mappers/user_mapper.dart';
import 'package:malina_flutter_project/features/shared/data/models/user_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';
import 'package:collection/collection.dart';
import 'package:bcrypt/bcrypt.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalDataSource local;

  AuthRepositoryImpl(this.local);

  // static const String _userCollectionName = "users";

  @override
  Future<UserEntity?> getCurrentUser() async {
    final UserModel? model = await local.getCurrentUser();
    return model?.toEntity();
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final UserModel userModel = user.toModel();
    await local.updateUser(userModel);
  }

  @override
  Future<bool> isLoggedIn() async {
    return local.getIsLoggedIn();
  }

  @override
  Future<UserEntity?> login({required String email, required String password}) async {
    final List<UserModel> users = await local.getUsersList();

    final UserModel? user = users.firstWhereOrNull((e) => e.email == email);
    if (user == null) return null;

    final bool isValid = BCrypt.checkpw(password, user.passwordHash);

    if (!isValid) {
      final UserModel updatedUser = user.copyWith(
        loginAttempts: user.loginAttempts + 1,
      );
      await local.updateUser(updatedUser);
      return null;
    }

    final UserModel loggedInUser = user.copyWith(loginAttempts: 0);
    await local.updateUser(loggedInUser);
    await local.setCurrentUser(loggedInUser.id);
    return loggedInUser.toEntity();
  }

  @override
  Future<UserEntity> register({required String email, required String password}) async {
    final List<UserModel> users = await local.getUsersList();

    final bool isEmailExist = users.any((e) => e.email == email);
    if (isEmailExist) {
      throw Exception("Email already taken");
    }

    final String newUserId = (await local.generateNewUserId()).toString();
    final String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

    final UserModel userModel = UserModel(id: newUserId, email: email, passwordHash: hashed);
    final UserModel createdUser = await local.createUser(userModel: userModel);

    await local.setCurrentUser(createdUser.id);

    return createdUser.toEntity();
  }
  @override
  Future<void> logout() async {
    await local.setIsLoggedIn(false);
  }

  @override
  Future<void> deleteUser(String userId) async {
    await local.deleteUser(userId);
  }

}