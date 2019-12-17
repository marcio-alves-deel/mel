import 'package:mel/entities.dart' show UserEntity;
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    @required uid,
    @required email,
    @required firstName,
    @required lastName,
    birthDate,
    avatar,
  }) : super(
          uid: uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
          avatar: avatar,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
