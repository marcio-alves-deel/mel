import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mel/datasources.dart'
    show UserLocalDataSource, UserRemoteDataSource;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/models.dart' show UserModel;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;

import 'package:mel/core.dart'
    show
        AuthenticationException,
        AuthenticationFailure,
        AuthorizationFailure,
        CacheException,
        CacheFailure,
        Failure,
        NetworkException,
        NetworkFailure,
        NetworkInfo,
        ServerException,
        ServerFailure;

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final FirebaseAuth firebaseAuth;

  UserRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo,
      @required this.firebaseAuth})
      : assert(remoteDataSource != null),
        assert(localDataSource != null),
        assert(networkInfo != null),
        assert(firebaseAuth != null);

  @override
  Future<Either<Failure, UserEntity>> authenticate(
      String email, String password) async {
    if (!await networkInfo.isConnected) return Left(NetworkFailure());

    try {
      final AuthResult authResult = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (authResult == null) return Left(AuthorizationFailure());
      final user = authResult.user;
      final result = await remoteDataSource.getUserData(user.uid);
      await localDataSource.cacheUserData(result);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    final FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      if (await networkInfo.isConnected) {
        try {
          final result = await remoteDataSource.getUserData(firebaseUser.uid);
          return Right(result);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        try {
          final result = await localDataSource.getLastUserData();
          return Right(result);
        } on ServerException {
          return Left(ServerFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    } else {
      return Left(AuthorizationFailure());
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
  Future<Either<Failure, UserEntity>> register(
      String email,
      String password,
      String firstName,
      String lastName,
      String birthDate,
      String avatar) async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected == true) {
      try {
        AuthResult authResult = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        final user = new UserModel(
            userId: authResult.user.uid,
            email: email,
            firstName: firstName,
            lastName: lastName,
            birthDate: birthDate,
            avatar: avatar);
        await remoteDataSource.createUser(user);
        await localDataSource.cacheUserData(user);
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        final result = await remoteDataSource.getUserData(user.userId);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(NetworkFailure());
  }
}
