import 'dart:convert';

import 'package:bookia/feature/auth/data/models/response/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences prefrences;

  static String KUserData = 'user_data';
  static String KEmail = 'email';
  static String Kotp = 'otp';

  static init() async {
    prefrences = await SharedPreferences.getInstance();
  }

  static setUserData(UserData? userdata) async {
    if (userdata == null) return;
    var objectJson = userdata.toJson();
    var UserDataString = jsonEncode(objectJson);
    await prefrences.setString(KUserData, UserDataString);
  }

  static UserData? getUserData() {
    var source = prefrences.getString(KUserData);
    if (source == null) {
      return null;
    }
    var objectJson = jsonDecode(source);
    var userdata = UserData.fromJson(objectJson);
    return userdata;
  }

  static String? getString(String key) {
    return prefrences.getString(key);
  }

  static Future<bool> setString(String key, String value) {
    return prefrences.setString(key, value);
  }

  static bool? getBool(String key) {
    return prefrences.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) {
    return prefrences.setBool(key, value);
  }

  static int? getInt(String key) {
    return prefrences.getInt(key);
  }

  static Future<bool> setInt(String key, int value) {
    return prefrences.setInt(key, value);
  }

  static double? getDouble(String key) {
    return prefrences.getDouble(key);
  }

  static Future<bool> setDouble(String key, double value) {
    return prefrences.setDouble(key, value);
  }

  static Future<bool> remove(String key) {
    return prefrences.remove(key);
  }

  static Future<bool> clear() {
    return prefrences.clear();
  }
}
