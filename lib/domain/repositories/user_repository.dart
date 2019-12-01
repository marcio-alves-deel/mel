import 'package:dartz/dartz.dart';
import 'package:mel/core.dart' show Failure;
import 'package:mel/entities.dart' show UserEntity;

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> authenticate(
      String email, String password);

  Future<Either<Failure, UserEntity>> currentUser();

  Future<Either<Failure, UserEntity>> register(String email, String password,
      String firstName, String lastName, String birthDate, String avatar);

  Future<Either<Failure, None>> signOut();
}
