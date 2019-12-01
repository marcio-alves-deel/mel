import 'package:mel/entities.dart' show UserEntity;
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    @required userId,
    @required email,
    @required firstName,
    @required lastName,
    birthDate,
    avatar,
  }) : super(
          userId: userId,
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
