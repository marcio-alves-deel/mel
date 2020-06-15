import 'package:mel/entities.dart' show PictureEntity;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'picture_model.g.dart';

@JsonSerializable()
class PictureModel extends PictureEntity {
  PictureModel({
    height,
    width,
    isSilhouette,
    url,
  }) : super(
          height: height,
          width: width,
          isSilhouette: isSilhouette,
          url: url,
        );

  factory PictureModel.fromJson(Map<String, dynamic> json) =>
      _$PictureModelFromJson(json);

  Map<String, dynamic> toJson() => _$PictureModelToJson(this);
}
