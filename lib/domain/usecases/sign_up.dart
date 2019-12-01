import 'package:dartz/dartz.dart';
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart';

class SignUp implements UseCases<UserEntity> {
  final UserRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, UserEntity>> call(
      {@required email,
      @required password,
      firstName,
      lastName,
      birthDate,
      avatar}) async {
    return await repository.register(
        email, password, firstName, lastName, birthDate, avatar);
  }
}
