import 'dart:convert' show json;
import 'package:mel/core.dart' show CacheException;
import 'package:mel/models.dart' show UserModel;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import 'package:meta/meta.dart' show required;

abstract class UserLocalDataSource {
  Future<UserModel> getLastUserData();
  Future<void> cacheUserData({UserModel user});
  Future<void> cleanUserData();
}

const CACHED_USER_DATA = 'cached_user_data';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({@required this.sharedPreferences})
      : assert(sharedPreferences != null);

  @override
  Future<void> cacheUserData({@required UserModel user}) {
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
  Future<UserModel> getLastUserData() {
    final jsonString = sharedPreferences.getString(
      CACHED_USER_DATA,
    );

    if (jsonString == null) return null;

    return Future.value(UserModel.fromJson(json.decode(jsonString)));
  }
}
