// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facebook_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacebookResponseModel _$FacebookResponseModelFromJson(
    Map<String, dynamic> json) {
  return FacebookResponseModel(
    email: json['email'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    birthday: json['birthday'],
    picture: json['picture']['data'] == null
        ? null
        : PictureModel.fromJson(
            json['picture']['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FacebookResponseModelToJson(
        FacebookResponseModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birthday': instance.birthday,
      'picture': instance.picture,
    };
