import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'pref.dart';

class PrefManager {
  Future<bool> save(Pref pref) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.setString(pref.key(), json.encode(pref.save()));
  }

  Future<bool> saveInt(String key, int value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.setInt(key, value);
  }

  Future<bool> saveString(String key, String value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.setString(key, value);
  }

  Future<bool> saveBool(String key, bool value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.setBool(key, value);
  }

  Future<bool> saveDouble(String key, double value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.setDouble(key, value);
  }

  Future<bool> saveStringList(String key, List<String> values) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.setStringList(key, values);
  }

  Future<T> read<T extends Pref>(Pref pref) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Map<String, dynamic> map = json.decode(shared.getString(pref.key()));
    pref = pref.read(map);

    return Future.value(pref as T);
  }

  Future<int> readInt(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getInt(key);
  }

  Future<String> readString(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(key);
  }

  Future<bool> readBool(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getBool(key);
  }

  Future<double> readDouble(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getDouble(key);
  }

  Future<List<String>> readStringList(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getStringList(key);
  }
}
