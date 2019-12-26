import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;

class Update implements UseCases<UserEntity> {
  final UserRepository repository;

  Update({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, UserEntity>> call(
      {String firstName,
      String lastName,
      String birthDate,
      String avatar}) async {
    return await repository.update(
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        avatar: avatar);
  }
}
