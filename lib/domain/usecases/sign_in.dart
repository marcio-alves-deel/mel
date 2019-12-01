import 'package:dartz/dartz.dart';
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart';

class SignIn implements UseCases<UserEntity> {
  final UserRepository repository;

  SignIn(this.repository);

  Future<Either<Failure, UserEntity>> call({
    @required email,
    @required password,
  }) async {
    return await repository.authenticate(email, password);
  }
}
