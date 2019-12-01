import 'package:mel/models.dart' show UserModel;

abstract class UserLocalDataSource {
  Future<UserModel> getLastUserData();
  Future<void> cacheUserData(UserModel modelToCache);
  Future<void> cleanUserData();
}
