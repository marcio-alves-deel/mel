import 'package:mel/core/error/exceptions.dart';
import 'package:mel/core/error/failures.dart';
import 'package:mel/models.dart' show UserModel;
import 'package:meta/meta.dart' show required;
import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, DocumentSnapshot, Firestore;
import 'package:dartz/dartz.dart' show Either, Left, Right, None;

abstract class UserRemoteDataSource {
  Future<UserModel> getUserData(String id);

  Future<void> deleteUser({String id});

  Future<UserModel> createUser(UserModel data);

  Future<bool> hasData(String id);
}

const USER_DATA_PATH = 'userData';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Firestore firestore;

  UserRemoteDataSourceImpl({@required this.firestore})
      : assert(firestore != null);

  @override
  Future<UserModel> getUserData(String id) async {
    final DocumentReference ref =
        firestore.collection(USER_DATA_PATH).document(id);

    final response = await ref.get();

    final UserModel user = UserModel.fromJson(response.data);
    return user;
  }

  @override
  Future<void> deleteUser({@required String id}) {
    return firestore.collection(USER_DATA_PATH).document(id).delete();
  }

  @override
  Future<UserModel> createUser(UserModel data) async {
    final DocumentReference ref =
        firestore.collection(USER_DATA_PATH).document(data.email);

    await ref.setData(data.toJson());

    final response = await ref.get();

    return UserModel.fromJson(response.data);
  }

  @override
  Future<bool> hasData(String id) async {
    final DocumentSnapshot snapshot =
        await firestore.collection(USER_DATA_PATH).document(id).get();
    return snapshot.data != null;
  }
}
