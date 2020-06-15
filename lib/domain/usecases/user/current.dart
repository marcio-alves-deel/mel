import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, NoParams, UseCases;
import 'package:mel/entities.dart' show User;
import 'package:mel/repositories.dart' show UserRepository;

class Current implements UseCases<User, NoParams> {
  final UserRepository repository;

  Current(this.repository) : assert(repository != null);

  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.current();
  }
}
