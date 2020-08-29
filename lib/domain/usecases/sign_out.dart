import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, NoParams, UseCase;
import 'package:mel/data.dart' show User;
import 'package:mel/domain.dart' show AuthRepository;

class SignOut implements UseCase<User, NoParams> {
  final AuthRepository repository;

  SignOut(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.signOut();
  }
}
