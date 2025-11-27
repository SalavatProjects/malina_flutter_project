import 'dart:convert';
import 'package:malina_flutter_project/core/services/id_generator.dart';
import 'package:malina_flutter_project/features/shared/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class UserLocalDataSource {
  final SharedPreferences prefs;

  UserLocalDataSource(this.prefs);

  static const String _usersListKey = 'users_list';
  static const String _userCollectionName = 'user';
  static const String _currentUserIdKey = 'current_user_id';
  static const String _isLoggedInKey = 'is_logged_in';

  Future<List<UserModel>> getUsersList() async {
    final String? jsonStr = prefs.getString(_usersListKey);
    if (jsonStr == null) return [];

    final List<dynamic> decodedJsonList = json.decode(jsonStr);
    return decodedJsonList.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<void> _saveUsersList(List<UserModel> users) async {
    await prefs.setString(_usersListKey, json.encode(users.map((e) => e.toJson()).toList()));
  }

  Future<UserModel?> getCurrentUser() async {
    // final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString(_currentUserIdKey);
    if (userId == null) return null;

    final List<UserModel> users = await getUsersList();
    return users.firstWhereOrNull((e) => e.id == userId);
  }

  Future<void> setCurrentUser(String userId) async {
    await prefs.setString(_currentUserIdKey, userId);
    await prefs.setBool(_isLoggedInKey, true);
  }

  Future<bool> getIsLoggedIn() async {
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> setIsLoggedIn(bool value) async {
     await prefs.setBool(_isLoggedInKey, value);
  }

  Future<int> generateNewUserId() async {
    return await IdGenerator.next(_userCollectionName);
  }

  Future<UserModel> createUser({required UserModel userModel}) async {
    final List<UserModel> users = await getUsersList();
    users.add(userModel);
    await _saveUsersList(users);
    return userModel;
  }

  Future<void> updateUser(UserModel updatedUser) async {
    final List<UserModel> users = await getUsersList();
    final List<UserModel> updatedUsers = users.map((e) {
      if(e.id == updatedUser.id) return updatedUser;
      return e;
    }).toList();

    await _saveUsersList(updatedUsers);
  }

  Future<void> deleteUser(String userId) async {
    final List<UserModel> users = await getUsersList();
    final List<UserModel> updatedUsers = users..removeWhere((e) => e.id == userId);
    await _saveUsersList(updatedUsers);
    await prefs.remove(_currentUserIdKey);
    await prefs.setBool(_isLoggedInKey, false);

  }
}