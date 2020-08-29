import 'package:mel/data/data.dart' show Message, User;
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:mel/domain.dart' show MessagesEntity;

part 'messages_model.g.dart';

@JsonSerializable()
class Messages extends MessagesEntity {
  Messages({
    @required receiver,
    @required messages,
    @required lastModifiedAt,
  }) : super(
          receiver: receiver,
          messages: messages,
          lastModifiedAt: lastModifiedAt,
        );

  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);
}
