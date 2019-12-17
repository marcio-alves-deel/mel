import 'package:dartz/dartz.dart' show Either, Left, Right, None;
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseUser, AuthResult;
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
import 'package:mel/datasources.dart'
    show UserLocalDataSource, UserRemoteDataSource;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/models.dart' show UserModel;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;

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
      {@required String email, @required String password}) async {
    if (!await networkInfo.isConnected) return Left(NetworkFailure());
    try {
      final AuthResult authResult = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (authResult == null) return Left(AuthorizationFailure());
      final user = authResult.user;
      final result = await remoteDataSource.getUserData(id: user.email);
      await localDataSource.cacheUserData(user: result);
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
  Future<Either<Failure, UserEntity>> current() async {
    try {
      final FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      if (firebaseUser == null) return Left(AuthorizationFailure());

      if (await networkInfo.isConnected) {
        final result =
            await remoteDataSource.getUserData(id: firebaseUser.email);
        localDataSource.cacheUserData(user: result);
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
  Future<Either<Failure, UserEntity>> register(
      {@required String email,
      @required String password,
      @required String firstName,
      @required String lastName,
      String birthDate,
      String avatar}) async {
    if (await networkInfo.isConnected == false) return Left(NetworkFailure());
    try {
      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      final user = new UserModel(
          uid: firebaseUser.uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
          avatar: avatar);
      await remoteDataSource.createUser(user: user);
      await localDataSource.cacheUserData(user: user);
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final result = await remoteDataSource.getUserData(id: user.email);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, None>> delete() async {
    if (await networkInfo.isConnected == false) return Left(NetworkFailure());
    try {
      final FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      await firebaseUser.delete();
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

  @override
  Future<Either<Failure, UserEntity>> update(
      {String firstName,
      String lastName,
      String birthDate,
      String avatar}) async {
    if (await networkInfo.isConnected == false) return Left(NetworkFailure());
    try {
      final FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      final UserModel newUserData = UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email,
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
          avatar: avatar);
      remoteDataSource.updateUserData(
          id: firebaseUser.email, user: newUserData);
      localDataSource.cacheUserData(user: newUserData);
      return null;
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
