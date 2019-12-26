import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show PostEntity;
import 'package:mel/repositories.dart' show PostRepository;
import 'package:meta/meta.dart' show required;

class GetById implements UseCases<PostEntity> {
  final PostRepository repository;

  GetById({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, PostEntity>> call({
    @required id,
  }) async {
    return await repository.getById(id: id);
  }
}
