import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:mel/domain.dart' show UserEntity;
import 'package:mel/data.dart' show Picture;

part 'user_model.g.dart';

@JsonSerializable()
class User extends UserEntity {
  User({
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

  get userName => '$firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
