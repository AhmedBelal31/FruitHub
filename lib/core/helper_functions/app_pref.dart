import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    final setters = <Type, Function>{
      String: (String value) async => await prefs.setString(key, value),
      bool: (bool value) async => await prefs.setBool(key, value),
      int: (int value) async => await prefs.setInt(key, value),
      double: (double value) async => await prefs.setDouble(key, value),
    };

    final setter = setters[value.runtimeType];
    if (setter != null) {
      await setter(value);
      return true;
    }

    return false;
  }

  static dynamic getData({required String key}) {
    return prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    await prefs.remove(key);
    return true;
  }

  static Future<bool> clearAllPrefs() async {
    await prefs.clear();
    return true;
  }
}
