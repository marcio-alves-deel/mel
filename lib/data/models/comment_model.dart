import 'package:mel/entities.dart' show CommentEntity;
import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends CommentEntity {
  CommentModel({@required id, @required createdAt, @required text})
      : super(id: id, createdAt: createdAt, text: text);

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
