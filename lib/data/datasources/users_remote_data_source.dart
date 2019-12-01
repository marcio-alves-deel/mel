import 'package:mel/models.dart' show UserModel;

abstract class UserRemoteDataSource {
  Future<UserModel> createUser(UserModel user);

  Future<UserModel> getUserData(String userId);

  Future<UserModel> updateUserData(String userId, UserModel user);

  Future<void> deleteUser(String userId);
}
