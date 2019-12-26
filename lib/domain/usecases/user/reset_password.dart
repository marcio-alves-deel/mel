import 'package:dartz/dartz.dart' show Either, None;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;

class ResetPassword implements UseCases<None> {
  final UserRepository repository;

  ResetPassword({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, None>> call() async {
    return await repository.resetPassword();
  }
}
