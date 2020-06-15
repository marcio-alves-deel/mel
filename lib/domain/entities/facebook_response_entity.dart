import 'package:equatable/equatable.dart' show Equatable;
import 'package:mel/models.dart' show PictureModel;

class FacebookResponseEntity extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String birthday;
  final PictureModel picture;

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
