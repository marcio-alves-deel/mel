import 'package:mel/entities.dart' show LocationEntity;
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  LocationModel({@required id, @required latitude, @required longitude, name})
      : super(id: id, latitude: latitude, longitude: longitude, name: name);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
