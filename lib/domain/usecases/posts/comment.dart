import 'package:dartz/dartz.dart' show Either, None;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/repositories.dart' show PostRepository;
import 'package:meta/meta.dart' show required;

class Comment implements UseCases<None> {
  final PostRepository repository;

  Comment({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, None>> call({@required id, comment}) async {
    return await repository.comment(id: id);
  }
}
