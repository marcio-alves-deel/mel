import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show required;

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String avatar;

  UserEntity({
    @required this.uid,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    this.birthDate,
    this.avatar,
  });

  @override
  List<Object> get props =>
      [uid, email, firstName, lastName, birthDate, avatar];
}
