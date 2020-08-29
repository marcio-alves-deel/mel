import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:firebase_auth/firebase_auth.dart'
    show AuthCredential, FacebookAuthProvider, FirebaseAuth, FirebaseUser;
import 'package:flutter_facebook_login/flutter_facebook_login.dart'
    show FacebookLogin, FacebookLoginBehavior, FacebookLoginStatus;
import 'package:mel/core.dart'
    show
        AuthenticationException,
        AuthenticationFailure,
        AuthorizationFailure,
        CacheException,
        CacheFailure,
        Failure,
        NetworkFailure,
        NetworkInfo,
        ServerException,
        ServerFailure;
import 'package:mel/data.dart'
    show AuthLocalDataSource, AuthRemoteDataSource, FacebookResponse, User;
import 'package:meta/meta.dart' show required;
import 'package:mel/domain.dart' show AuthRepository;

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final FirebaseAuth firebaseAuth;
  final FacebookLogin facebookLogin;

  AuthRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo,
      @required this.firebaseAuth,
      @required this.facebookLogin})
      : assert(remoteDataSource != null),
        assert(localDataSource != null),
        assert(networkInfo != null),
        assert(firebaseAuth != null),
        assert(facebookLogin != null);

  @override
  Future<Either<Failure, User>> signInWithFacebook([
    AuthCredential credential,
  ]) async {
    if (!await networkInfo.isConnected) return Left(NetworkFailure());
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    final loginResult = await facebookLogin.logIn([
      'email',
      'public_profile',
    ]);

    switch (loginResult.status) {
      case FacebookLoginStatus.loggedIn:
        final AuthCredential authCredential =
            FacebookAuthProvider.getCredential(
                accessToken: loginResult.accessToken.token);

        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,picture.type(large),last_name,email&access_token=${loginResult.accessToken.token}');

        final FacebookResponse facebookResponse = FacebookResponse.fromJson(
          json.decode(graphResponse.body),
        );

        final bool hasData =
            await remoteDataSource.hasData(facebookResponse.email);

        User user;
        if (!hasData) {
          final User newUser = new User(
            email: facebookResponse.email,
            firstName: facebookResponse.firstName,
            lastName: facebookResponse.lastName,
            birthday: facebookResponse.birthday,
            picture: facebookResponse.picture,
          );
          user = await remoteDataSource.createUser(newUser);
          firebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: user.email);
        } else {
          user = await remoteDataSource.getUserData(facebookResponse.email);
        }

        await firebaseAuth.signInWithCredential(authCredential);

        await localDataSource.cacheUserData(user);
        return Right(user);

      case FacebookLoginStatus.cancelledByUser:
        return Left(AuthorizationFailure());
      case FacebookLoginStatus.error:
        return Left(AuthenticationFailure());
      default:
        return Left(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    if (!await networkInfo.isConnected) return Left(NetworkFailure());

    try {
      final currentUser = await firebaseAuth.currentUser();
      return Right(currentUser != null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getCurrent() async {
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
  Future<Either<Failure, User>> signOut() async {
    try {
      await localDataSource.cleanUserData();
      firebaseAuth.signOut();
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
