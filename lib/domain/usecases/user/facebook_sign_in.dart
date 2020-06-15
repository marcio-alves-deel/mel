import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show User;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;
import 'package:super_enum/super_enum.dart';

class FacebookAuth implements UseCases<User, FacebookParams> {
  final UserRepository repository;

  FacebookAuth(this.repository) : assert(repository != null);

  Future<Either<Failure, User>> call(FacebookParams params) async {
    return await repository.authenticateFacebook(params.authInstance);
  }
}

class FacebookParams extends Equatable {
  final FacebookLogin authInstance;

  FacebookParams({@required this.authInstance});

  @override
  List<FacebookLogin> get props => [authInstance];
}
