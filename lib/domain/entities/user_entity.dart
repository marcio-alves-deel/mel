import 'package:equatable/equatable.dart' show Equatable;
import 'package:mel/models.dart' show PictureModel;
import 'package:meta/meta.dart' show required;

class User extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String birthday;
  final PictureModel picture;

  User({
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    this.picture,
    this.birthday,
  });

  @override
  List<Object> get props => [email, firstName, lastName, birthday, picture];
}
