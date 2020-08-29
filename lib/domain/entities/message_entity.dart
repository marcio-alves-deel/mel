import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show required;

class MessageEntity extends Equatable {
  final String content;
  final DateTime createdAt;
  final bool isRead;
  final bool isSender;

  MessageEntity(
      {@required this.content,
      @required this.createdAt,
      @required this.isRead,
      @required this.isSender});

  @override
  List<Object> get props => [
        content,
        createdAt,
        isRead,
        isSender,
      ];
}
