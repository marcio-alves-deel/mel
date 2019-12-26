import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show required;

class CommentEntity extends Equatable {
  final String id;
  final String createdAt;
  final String text;

  CommentEntity(
      {@required this.id, @required this.createdAt, @required this.text});

  @override
  List<Object> get props => [id, createdAt, text];
}
