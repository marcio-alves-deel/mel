import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure;
import 'package:super_enum/super_enum.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  @override
  List<Object> get props => [];
}
