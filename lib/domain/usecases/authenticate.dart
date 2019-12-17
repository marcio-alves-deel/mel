import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;

class Authenticate implements UseCases<UserEntity> {
  final UserRepository repository;

  Authenticate({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, UserEntity>> call({
    @required email,
    @required password,
  }) async {
    return await repository.authenticate(email: email, password: password);
  }
}
