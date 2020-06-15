import 'package:dartz/dartz.dart' show Either, None;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mel/core.dart' show Failure;
import 'package:mel/entities.dart' show User;

abstract class UserRepository {
  Future<Either<Failure, User>> authenticateFacebook([
    FacebookLogin authInstance,
  ]);

  Future<Either<Failure, User>> authenticateGoogle([
    GoogleSignIn authInstance,
  ]);

  Future<Either<Failure, User>> current();

  Future<Either<Failure, None>> resetPassword();

  Future<Either<Failure, None>> signOut();

  Future<Either<Failure, None>> delete();
}
