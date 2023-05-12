import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppConsts.dart';

class Utils {
  static SharedPreferences? prefs;
  static final navigatorKey = GlobalKey<NavigatorState>();
  static ValueNotifier<Locale> locale = new ValueNotifier(Locale('en', ''));

  // Returns TRUE if the Internet Connection is available and connected
  static Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Debug.setLog('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      Debug.setLog('not connected');
      return false;
    }
  }

  static Future setPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  // ---------------------- String ----------------------
  static Future setPrefString(String key, String value) async {
    if (prefs == null) await setPref();
    prefs!.setString(key, value);
  }

  static Future<String> getPrefString(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getString(key) ?? '';
  }

  // ---------------------- Bool ----------------------
  static Future setPrefBool(String key, bool value) async {
    if (prefs == null) await setPref();
    prefs!.setBool(key, value);
  }

  static Future<bool> getPrefBool(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getBool(key) ?? false;
  }

  // ---------------------- Double ----------------------
  static Future setPrefDouble(String key, double value) async {
    if (prefs == null) await setPref();
    prefs!.setDouble(key, value);
  }

  static Future<double> getPrefDouble(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getDouble(key) ?? 0.0;
  }

  // ---------------------- Integer ----------------------
  static Future setPrefInteger(String key, int value) async {
    if (prefs == null) await setPref();
    prefs!.setInt(key, value);
  }

  static Future<int> getPrefInteger(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getInt(key) ?? 0;
  }

  // ---------------------- List<String> ----------------------
  static Future setPrefListString(String key, List<String> value) async {
    Debug.setLog("1234 setPRef contact list ${value.toString()}");
    if (prefs == null) await setPref();
    prefs!.setStringList(key, value);
  }

  static Future<List<String>> getPrefListString(String key) async {
    if (prefs == null) await setPref();
    return prefs!.getStringList(key) ?? [];
  }

  static Future clearPrefsData() async {
    if (prefs == null) await setPref();
    // return prefs!.clear();
  }
}
