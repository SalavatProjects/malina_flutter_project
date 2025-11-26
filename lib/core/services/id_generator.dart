import 'package:shared_preferences/shared_preferences.dart';

abstract class IdGenerator {
  static const String _keyPrefix = 'auto_id_';

  static Future<int> next(String collectionName) async {
    final prefs = await SharedPreferences.getInstance();

    final String key = '$_keyPrefix$collectionName';
    final int last = prefs.getInt(key) ?? 0;

    final int nextId = last + 1;
    await prefs.setInt(key, nextId);

    return nextId;
  }

}