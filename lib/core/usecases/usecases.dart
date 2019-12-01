import 'package:dartz/dartz.dart';
import 'package:mel/core.dart' show Failure;

abstract class UseCases<Type> {
  Future<Either<Failure, Type>> call();
}
