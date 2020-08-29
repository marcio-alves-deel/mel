import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:mel/domain.dart' show MessageEntity;

part 'message_model.g.dart';

@JsonSerializable()
class Message extends MessageEntity {
  Message({
    @required content,
    @required createdAt,
    @required isRead,
    @required isSender,
  }) : super(
            content: content,
            createdAt: createdAt,
            isRead: isRead,
            isSender: isSender);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
