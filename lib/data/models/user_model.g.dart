// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    email: json['email'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    birthday: json['birthday'],
    picture: json['picture'] == null
        ? json['picture']['data'] == null
            ? null
            : PictureModel.fromJson(
                json['picture']['data'] as Map<String, dynamic>)
        : PictureModel.fromJson(json['picture'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birthday': instance.birthday,
      'picture': instance.picture == null ? null : instance.picture.toJson(),
    };
