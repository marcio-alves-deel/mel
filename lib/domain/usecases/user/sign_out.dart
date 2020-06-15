import 'package:dartz/dartz.dart' show None, Either;
import 'package:meta/meta.dart' show required;
import 'package:mel/core.dart' show Failure, NoParams, UseCases;
import 'package:mel/repositories.dart' show UserRepository;

class SignOut implements UseCases<None, NoParams> {
  final UserRepository repository;

  SignOut({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, None>> call(NoParams params) async {
    return await repository.signOut();
  }
}
