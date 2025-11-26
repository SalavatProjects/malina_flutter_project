import 'dart:convert';
import 'package:malina_flutter_project/core/services/id_generator.dart';
import 'package:malina_flutter_project/features/shared/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  static const String _userKey = 'user_data';
  static const String _userCollectionName = 'user';

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;

    return UserModel.fromJson(json.decode(jsonString));
  }

  Future<void> saveUser(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(userModel.toJson()));
  }

  Future<UserModel> createUser({
    required String email,
    required String passwordHash
}) async {
    final int id = await IdGenerator.next(_userCollectionName);

    final UserModel model = UserModel(
        id: id,
        email: email,
        passwordHash: passwordHash);

    await saveUser(model);

    return model;
  }
}