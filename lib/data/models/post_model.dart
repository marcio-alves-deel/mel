import 'package:mel/entities.dart' show PostEntity;
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends PostEntity {
  PostModel(
      {@required id,
      @required uid,
      @required type,
      @required title,
      @required description,
      @required createdAt,
      @required updatedAt,
      @required isActive,
      @required location,
      gallery,
      likes,
      shares,
      comments,
      petInfo})
      : super(
            id: id,
            uid: uid,
            title: title,
            type: type,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isActive: isActive,
            location: location,
            gallery: gallery,
            likes: likes,
            shares: shares,
            comments: comments,
            petInfo: petInfo);

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
