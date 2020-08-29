import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, NoParams, UseCase;
import 'package:mel/domain.dart' show AuthRepository;

class IsSignedIn implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  IsSignedIn(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.isSignedIn();
  }
}
