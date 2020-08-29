// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Messages _$MessagesModelFromJson(Map<String, dynamic> json) {
  return Messages(
    receiver: json['receiver'],
    lastModifiedAt: json['lastModifiedAt'],
    messages: json['messages'].map((message) => Message.fromJson(message)),
  );
}
