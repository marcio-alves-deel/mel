import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:mel/data.dart' show Picture;
import 'package:mel/domain.dart' show FacebookResponseEntity;

part 'facebook_response_model.g.dart';

@JsonSerializable()
class FacebookResponse extends FacebookResponseEntity {
  FacebookResponse({
    String email,
    String firstName,
    String lastName,
    String birthday,
    Picture picture,
  }) : super(
          email: email,
          firstName: firstName,
          lastName: lastName,
          birthday: birthday,
          picture: picture,
        );

  factory FacebookResponse.fromJson(Map<String, dynamic> json) =>
      _$FacebookResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacebookResponseModelToJson(this);
}
