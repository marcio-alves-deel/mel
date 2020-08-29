import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:mel/domain.dart' show PictureEntity;

part 'picture_model.g.dart';

@JsonSerializable()
class Picture extends PictureEntity {
  Picture({
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

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureModelFromJson(json);

  Map<String, dynamic> toJson() => _$PictureModelToJson(this);
}
