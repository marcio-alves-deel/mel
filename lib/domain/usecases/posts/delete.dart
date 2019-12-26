import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show PostEntity;
import 'package:mel/repositories.dart' show PostRepository;
import 'package:meta/meta.dart' show required;

class Delete implements UseCases<PostEntity> {
  final PostRepository repository;

  Delete({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, PostEntity>> call({
    @required id,
  }) async {
    return await repository.delete(id: id);
  }
}
