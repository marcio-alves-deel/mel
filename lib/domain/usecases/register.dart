import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;

class Register implements UseCases<UserEntity> {
  final UserRepository repository;

  Register({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, UserEntity>> call(
      {@required email,
      @required password,
      firstName,
      lastName,
      birthDate,
      avatar}) async {
    return await repository.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        avatar: avatar);
  }
}
