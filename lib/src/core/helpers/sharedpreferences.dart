// ignore_for_file: file_names, avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final String _isFirstOpen = "firstOpen";
  final String _token = "token";

  Future<bool> setIsFirstOpen(bool first) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setBool(_isFirstOpen, first);
    print('First Open $res');
    return res;
  }

  Future<bool> getIsFirstOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = prefs.getBool(_isFirstOpen) ?? true;
    print('First Open $res');
    return res;
  }

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(_token, "Bearer $token");
    print('Token $res');
    return res;
  }

  Future<bool> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.remove(_token);
    print('Token $res');
    return res;
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? res = prefs.getString(_token);
    print('Token $res');
    return res;
  }
}
