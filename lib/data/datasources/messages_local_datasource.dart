import 'package:flutter/material.dart' show required;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

abstract class MessagesLocalDataSource {
  Future<void> cacheUserData();
}

const CACHED_MESSAGES_DATA = 'cached_user_data';

class MessagesLocalDataSourceImpl implements MessagesLocalDataSource {
  final SharedPreferences sharedPreferences;

  MessagesLocalDataSourceImpl({@required this.sharedPreferences})
      : assert(sharedPreferences != null);

  @override
  Future<void> cacheUserData() {
    return null;
  }
}
