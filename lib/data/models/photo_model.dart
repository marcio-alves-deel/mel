import 'package:mel/entities.dart' show PhotoEntity;
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends PhotoEntity {
  PhotoModel({@required id, @required description, @required src})
      : super(
          id: id,
          description: description,
          src: src,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
