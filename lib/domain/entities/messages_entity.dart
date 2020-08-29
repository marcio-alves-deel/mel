import 'package:equatable/equatable.dart' show Equatable;
import 'package:mel/data.dart' show Message;
import 'package:meta/meta.dart' show required;

class MessagesEntity extends Equatable {
  final String receiver;
  final List<Message> messages;
  final String lastModifiedAt;

  MessagesEntity({
    @required this.receiver,
    @required this.messages,
    @required this.lastModifiedAt,
  });

  @override
  List<Object> get props => [
        receiver,
        messages,
        lastModifiedAt,
      ];
}
