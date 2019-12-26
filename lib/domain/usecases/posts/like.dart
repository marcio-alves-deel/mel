import 'package:dartz/dartz.dart' show Either, None;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/repositories.dart' show PostRepository;
import 'package:meta/meta.dart' show required;

class Like implements UseCases<None> {
  final PostRepository repository;

  Like({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, None>> call({
    @required id,
  }) async {
    return await repository.like(id: id);
  }
}
