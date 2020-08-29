import 'package:equatable/equatable.dart' show Equatable;
import 'package:mel/data.dart' show Picture;
import 'package:meta/meta.dart' show required;

class UserEntity extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String birthday;
  final Picture picture;

  UserEntity({
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    this.picture,
    this.birthday,
  });

  @override
  List<Object> get props => [email, firstName, lastName, birthday, picture];
}
