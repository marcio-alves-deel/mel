import 'package:mel/entities.dart' show User;
import 'package:mel/models.dart';
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  UserModel({
    @required email,
    @required firstName,
    @required lastName,
    birthday,
    picture,
  }) : super(
          email: email,
          firstName: firstName,
          lastName: lastName,
          birthday: birthday,
          picture: picture,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
