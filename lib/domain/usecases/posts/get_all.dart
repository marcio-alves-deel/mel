import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show PostEntity;
import 'package:mel/repositories.dart' show PostRepository;
import 'package:meta/meta.dart' show required;

class GetAll implements UseCases<List<PostEntity>> {
  final PostRepository repository;

  GetAll({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, List<PostEntity>>> call({
    @required filters,
  }) async {
    return await repository.getAll(filters: filters);
  }
}
