import 'package:mel/data.dart' show User;
import 'package:meta/meta.dart' show required;
import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, DocumentSnapshot, Firestore;

abstract class AuthRemoteDataSource {
  Future<User> getUserData(String id);

  Future<void> deleteUser({String id});

  Future<User> createUser(User data);

  Future<bool> hasData(String id);
}

const USER_DATA_PATH = 'userData';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Firestore firestore;

  AuthRemoteDataSourceImpl({@required this.firestore})
      : assert(firestore != null);

  @override
  Future<User> getUserData(String id) async {
    final DocumentReference ref =
        firestore.collection(USER_DATA_PATH).document(id);

    final response = await ref.get();

    final User user = User.fromJson(response.data);
    return user;
  }

  @override
  Future<void> deleteUser({@required String id}) {
    return firestore.collection(USER_DATA_PATH).document(id).delete();
  }

  @override
  Future<User> createUser(User data) async {
    final DocumentReference ref =
        firestore.collection(USER_DATA_PATH).document(data.email);

    await ref.setData(data.toJson());

    final response = await ref.get();

    return User.fromJson(response.data);
  }

  @override
  Future<bool> hasData(String id) async {
    final DocumentSnapshot snapshot =
        await firestore.collection(USER_DATA_PATH).document(id).get();
    return snapshot.data != null;
  }
}
