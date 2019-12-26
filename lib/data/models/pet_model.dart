import 'package:mel/entities.dart' show PetEntity;
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel extends PetEntity {
  PetModel({@required id, @required name, birthDate, size, breed, color})
      : super(
            id: id,
            name: name,
            birthDate: birthDate,
            size: size,
            breed: breed,
            color: color);

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
