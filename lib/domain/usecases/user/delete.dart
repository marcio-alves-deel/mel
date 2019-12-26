import 'package:dartz/dartz.dart' show None, Either;
import 'package:meta/meta.dart' show required;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/repositories.dart' show UserRepository;

class Delete implements UseCases<None> {
  final UserRepository repository;

  Delete({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, None>> call() async {
    return await repository.delete();
  }
}
