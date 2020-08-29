// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageModelFromJson(Map<String, dynamic> json) {
  return Message(
    content: json['content'],
    createdAt: DateTime.parse(json['createdAt'].toDate().toString()).toUtc(),
    isRead: json['isRead'],
    isSender: json['isSender'],
  );
}
