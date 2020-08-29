import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure;
import 'package:mel/data.dart' show User;

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithFacebook();

  Future<Either<Failure, bool>> isSignedIn();

  Future<Either<Failure, User>> getCurrent();

  Future<Either<Failure, User>> signOut();
}
