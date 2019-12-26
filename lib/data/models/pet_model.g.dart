// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return PetModel(
    id: json['id'],
    name: json['name'],
    birthDate: json['birthDate'],
    size: json['size'],
    breed: json['breed'],
    color: json['color'],
  );
}

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthDate': instance.birthDate,
      'size': instance.size,
      'breed': instance.breed,
      'color': instance.color,
    };
