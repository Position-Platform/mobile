// ignore_for_file: file_names, avoid_print

import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SharedPreferencesHelper {
  final String _isFirstOpen = "firstOpen";
  final String _token = "token";
  final String _downloadMap = "downloadmap";
  final String _expireToken = "expiretoken";

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

  Future<bool> setIsDownloadMap(bool download) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setBool(_downloadMap, download);
    print('Download Map $res');
    return res;
  }

  Future<bool> getIsDownloadMap() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = prefs.getBool(_downloadMap) ?? false;
    print('Download Map $res');
    return res;
  }

  Future<bool> setExpireToken() async {
    var expireDate = DateTime.now().add(const Duration(days: 30));
    String saveDate = DateFormat('yyyy-MM-dd').format(expireDate);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(_expireToken, saveDate);
    print('Expire Date $res');
    return res;
  }

  Future<DateTime> getExpireToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String saveDate = prefs.getString(_expireToken) ?? "";
    DateTime expireDate = DateTime.parse(saveDate);
    print('Expire Date $expireDate');
    return expireDate;
  }
}
