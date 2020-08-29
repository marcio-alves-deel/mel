import 'dart:convert' show json;
import 'package:flutter/material.dart' show required;
import 'package:mel/core.dart' show CacheException;
import 'package:mel/data.dart' show User;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

abstract class AuthLocalDataSource {
  Future<User> getLastUserData();
  Future<void> cacheUserData(User user);
  Future<void> cleanUserData();
}

const CACHED_USER_DATA = 'cached_user_data';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences})
      : assert(sharedPreferences != null);

  @override
  Future<void> cacheUserData(User user) {
    if (user == null) throw CacheException();

    return sharedPreferences.setString(
      CACHED_USER_DATA,
      json.encode(user.toJson()),
    );
  }

  @override
  Future<void> cleanUserData() {
    return sharedPreferences.remove(CACHED_USER_DATA);
  }

  @override
  Future<User> getLastUserData() {
    final jsonString = sharedPreferences.getString(
      CACHED_USER_DATA,
    );

    if (jsonString == null) return null;
    return Future.value(User.fromJson(json.decode(jsonString)));
  }
}
