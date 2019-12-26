import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show required;
import 'package:mel/models.dart'
    show PhotoModel, CommentModel, PetModel, LocationModel;

class PostEntity extends Equatable {
  final String id;
  final String uid;
  final String type;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;
  final bool isActive;
  final List<PhotoModel> gallery;
  final int likes;
  final int shares;
  final List<CommentModel> comments;
  final LocationModel location;
  final PetModel petInfo;

  PostEntity(
      {@required this.id,
      @required this.uid,
      @required this.type,
      @required this.title,
      @required this.description,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.isActive,
      @required this.location,
      this.gallery,
      this.likes,
      this.shares,
      this.comments,
      this.petInfo});

  @override
  List<Object> get props => [
        id,
        uid,
        type,
        title,
        description,
        createdAt,
        updatedAt,
        isActive,
        location,
        gallery,
        likes,
        shares,
        comments,
        petInfo
      ];
}
