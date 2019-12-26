// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    id: json['id'],
    uid: json['uid'],
    type: json['type'],
    title: json['title'],
    description: json['description'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    isActive: json['isActive'],
    location: json['location'],
    gallery: json['gallery'],
    likes: json['likes'],
    shares: json['shares'],
    comments: json['comments'],
    petInfo: json['petInfo'],
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isActive': instance.isActive,
      'gallery': instance.gallery,
      'likes': instance.likes,
      'shares': instance.shares,
      'comments': instance.comments,
      'location': instance.location,
      'petInfo': instance.petInfo,
    };
