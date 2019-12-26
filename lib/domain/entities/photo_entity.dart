import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show required;

class PhotoEntity extends Equatable {
  final String id;
  final String description;
  final String src;

  PhotoEntity({@required this.id, this.description, @required this.src});

  @override
  List<Object> get props => [id, description, src];
}
