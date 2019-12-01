import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mel/datasources.dart'
    show UserLocalDataSource, UserRemoteDataSource;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/models.dart' show UserModel;
import 'package:mel/providers.dart' show UserAuthProviderImpl;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart';

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
  final UserAuthProviderImpl userAuthProvider;

  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
    @required this.userAuthProvider,
  })  : assert(remoteDataSource != null),
        assert(localDataSource != null),
        assert(networkInfo != null),
        assert(userAuthProvider != null);

  @override
  Future<Either<Failure, UserEntity>> authenticate(
      String email, String password) async {
    try {
      final FirebaseUser user =
          await userAuthProvider.signInWithEmailAndPassword(email, password);
      final result = await remoteDataSource.getUserData(user.uid);
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
    final FirebaseUser firebaseUser = await userAuthProvider.currentUser();
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
      userAuthProvider.signOut();
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
        FirebaseUser firebaseUser = await userAuthProvider
            .createUserWithEmailAndPassword(email, password);
        final user = new UserModel(
            userId: firebaseUser.uid,
            email: email,
            firstName: firstName,
            lastName: lastName,
            birthDate: birthDate,
            avatar: avatar);
        await remoteDataSource.createUser(user);
        await localDataSource.cacheUserData(user);
        await userAuthProvider.signInWithEmailAndPassword(email, password);
        final result = await remoteDataSource.getUserData(user.userId);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(NetworkFailure());
  }
}
