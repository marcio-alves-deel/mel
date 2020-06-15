import 'package:dartz/dartz.dart' show Either, Left, None, Right;
import 'package:firebase_auth/firebase_auth.dart'
    show AuthResult, FacebookAuthProvider, FirebaseAuth, FirebaseUser;
import 'package:flutter_facebook_login/flutter_facebook_login.dart'
    show FacebookLogin, FacebookLoginStatus;
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn;
import 'package:mel/core.dart'
    show
        AuthenticationException,
        AuthenticationFailure,
        AuthorizationFailure,
        CacheException,
        CacheFailure,
        CanceledOperation,
        Failure,
        NetworkException,
        NetworkFailure,
        NetworkInfo,
        ServerException,
        ServerFailure;
import 'package:mel/datasources.dart'
    show UserLocalDataSource, UserRemoteDataSource;
import 'package:mel/entities.dart' show User;
import 'package:mel/models.dart';
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final FirebaseAuth firebaseAuth;

  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
    @required this.firebaseAuth,
  })  : assert(remoteDataSource != null),
        assert(localDataSource != null),
        assert(networkInfo != null),
        assert(firebaseAuth != null);

  @override
  Future<Either<Failure, User>> authenticateFacebook([
    FacebookLogin authInstance,
    FacebookAuthProvider authProvider,
  ]) async {
    if (!await networkInfo.isConnected) return Left(NetworkFailure());

    FacebookResponseModel facebookResponse;
    UserModel user;

    try {
      final signInResult = await authInstance.logIn([
        'email',
        "public_profile",
      ]);

      switch (signInResult.status) {
        case FacebookLoginStatus.loggedIn:
          final token = signInResult.accessToken.token;
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=first_name,last_name,picture,email,address,birthday,gender&access_token=$token');
          facebookResponse = FacebookResponseModel.fromJson(
              JSON.jsonDecode(graphResponse.body));

          final bool hasData =
              await remoteDataSource.hasData(facebookResponse.email);

          if (!hasData) {
            final UserModel newUser = new UserModel(
              email: facebookResponse.email,
              firstName: facebookResponse.firstName,
              lastName: facebookResponse.lastName,
              birthday: facebookResponse.birthday,
              picture: facebookResponse.picture,
            );
            user = await remoteDataSource.createUser(newUser);
            firebaseAuth.createUserWithEmailAndPassword(
                email: user.email, password: null);
          } else {
            user = await remoteDataSource.getUserData(facebookResponse.email);
          }

          await firebaseAuth.signInWithCredential(
            FacebookAuthProvider.getCredential(
              accessToken: signInResult.accessToken.token,
            ),
          );

          await localDataSource.cacheUserData(user);
          return Right(user);
        case FacebookLoginStatus.cancelledByUser:
          return Left(CanceledOperation());
        case FacebookLoginStatus.error:
          return Left(AuthorizationFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> authenticateGoogle([
    GoogleSignIn authInstance,
  ]) async {
    if (!await networkInfo.isConnected) return Left(NetworkFailure());
    try {
      AuthResult authResult;

      if (authResult == null) return Left(AuthorizationFailure());
      final user = authResult.user;
      final result = await remoteDataSource.getUserData(user.email);
      await localDataSource.cacheUserData(result);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> current() async {
    try {
      final FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      if (firebaseUser == null) return Left(AuthorizationFailure());

      if (await networkInfo.isConnected) {
        final result = await remoteDataSource.getUserData(firebaseUser.email);
        localDataSource.cacheUserData(result);
        return Right(result);
      } else {
        final result = await localDataSource.getLastUserData();
        return Right(result);
      }
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, None>> signOut() async {
    try {
      await localDataSource.cleanUserData();
      firebaseAuth.signOut();
      return null;
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, None>> delete() async {
    if (await networkInfo.isConnected == false) return Left(NetworkFailure());
    try {
      final FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      await firebaseUser.delete();
      await remoteDataSource.deleteUser();
      await localDataSource.cleanUserData();
      return null;
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, None>> resetPassword() async {
    if (await networkInfo.isConnected == false) return Left(NetworkFailure());
    try {
      final FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      firebaseAuth.sendPasswordResetEmail(email: firebaseUser.email);
      return null;
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
