import 'package:dartz/dartz.dart';
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/repositories.dart' show UserRepository;

class SignOut implements UseCases<None> {
  final UserRepository repository;

  SignOut(this.repository);

  Future<Either<Failure, None>> call() async {
    return await repository.signOut();
  }
}
