import 'package:equatable/equatable.dart' show Equatable;
import 'package:mel/entities.dart' show LocationEntity;

class FilterEntity extends Equatable {
  final int distance;
  final int size;
  final int age;
  final LocationEntity location;
  final int type;

  FilterEntity({this.distance, this.size, this.age, this.location, this.type});

  @override
  List<Object> get props => [distance, size, age, location, type];
}
