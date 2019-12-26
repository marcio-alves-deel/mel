import 'package:mel/models.dart' show UserModel;
import 'package:meta/meta.dart' show required;
import 'package:cloud_firestore/cloud_firestore.dart'
    show Firestore, DocumentSnapshot;

abstract class UserRemoteDataSource {
  Future<void> createUser({UserModel user});

  Future<UserModel> getUserData({String id});

  Future<UserModel> updateUserData({String id, UserModel user});

  Future<void> deleteUser({String id});
}

const USER_DATA_PATH = 'userData';

abstract class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Firestore firestore;
  UserRemoteDataSourceImpl({@required this.firestore});

  Future<void> createUser({@required UserModel user}) async {
    return firestore
        .collection(USER_DATA_PATH)
        .document(user.email)
        .setData(user.toJson());
  }

  Future<UserModel> getUserData({@required String id}) async {
    final DocumentSnapshot snapshot =
        await firestore.collection(USER_DATA_PATH).document(id).get();
    final UserModel user = UserModel.fromJson(snapshot.data);
    return user;
  }

  Future<UserModel> updateUserData(
      {@required String id, @required UserModel user}) {
    return firestore
        .collection(USER_DATA_PATH)
        .document(id)
        .updateData(user.toJson());
  }

  Future<void> deleteUser({@required String id}) {
    return firestore.collection(USER_DATA_PATH).document(id).delete();
  }
}
