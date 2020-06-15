import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:mel/entities.dart';
import 'package:mel/models.dart';
part 'facebook_response_model.g.dart';

@JsonSerializable()
class FacebookResponseModel extends FacebookResponseEntity {
  FacebookResponseModel({
    String email,
    String firstName,
    String lastName,
    String birthday,
    PictureModel picture,
  }) : super(
          email: email,
          firstName: firstName,
          lastName: lastName,
          birthday: birthday,
          picture: picture,
        );

  factory FacebookResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FacebookResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacebookResponseModelToJson(this);
}
