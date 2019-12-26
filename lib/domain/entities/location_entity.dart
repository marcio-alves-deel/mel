import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show required;

class LocationEntity extends Equatable {
  final String id;
  final String latitude;
  final String longitude;
  final String name;

  LocationEntity(
      {@required this.id,
      @required this.latitude,
      @required this.longitude,
      this.name});

  @override
  List<Object> get props => [id, latitude, longitude, name];
}
