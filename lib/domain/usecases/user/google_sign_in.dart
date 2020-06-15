import 'package:dartz/dartz.dart' show Either;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show User;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:meta/meta.dart' show required;
import 'package:super_enum/super_enum.dart';

class GoogleAuth implements UseCases<User, GoogleParams> {
  final UserRepository repository;

  GoogleAuth(this.repository) : assert(repository != null);

  Future<Either<Failure, User>> call(GoogleParams params) async {
    return await repository.authenticateGoogle(params.authInstance);
  }
}

class GoogleParams extends Equatable {
  final GoogleSignIn authInstance;

  GoogleParams({@required this.authInstance});

  @override
  List<GoogleSignIn> get props => [authInstance];
}
