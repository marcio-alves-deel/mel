import 'package:equatable/equatable.dart' show Equatable;
import 'package:mel/data.dart' show Picture;

class FacebookResponseEntity extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String birthday;
  final Picture picture;

  FacebookResponseEntity({
    this.email,
    this.firstName,
    this.lastName,
    this.birthday,
    this.picture,
  });

  @override
  List<Object> get props => [email, firstName, lastName, birthday, picture];
}
