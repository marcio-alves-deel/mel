// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureModelFromJson(Map<String, dynamic> json) {
  return Picture(
    height: json['height'],
    width: json['width'],
    isSilhouette: json['is_silhouette'],
    url: json['url'],
  );
}

Map<String, dynamic> _$PictureModelToJson(Picture instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'is_silhouette': instance.isSilhouette,
      'url': instance.url,
    };
