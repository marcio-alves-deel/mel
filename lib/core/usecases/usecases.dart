import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure;

abstract class UseCases<Type> {
  Future<Either<Failure, Type>> call();
}
