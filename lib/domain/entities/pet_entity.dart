import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show required;

class PetEntity extends Equatable {
  final String id;
  final String name;
  final String birthDate;
  final String size;
  final String breed;
  final String color;

  PetEntity(
      {@required this.id,
      @required this.name,
      this.birthDate,
      this.size,
      this.breed,
      this.color});

  @override
  List<Object> get props => [id, name, birthDate, size, breed, color];
}
