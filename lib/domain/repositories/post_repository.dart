import 'package:dartz/dartz.dart' show Either, None;
import 'package:mel/core.dart' show Failure;
import 'package:mel/entities.dart' show CommentEntity, FilterEntity, PostEntity;
import 'package:mel/models.dart' show PhotoModel, LocationModel, PetModel;

abstract class PostRepository {
  Future<Either<Failure, PostEntity>> create({
    String uid,
    String title,
    String type,
    String description,
    List<PhotoModel> gallery,
    LocationModel location,
    PetModel petInfo,
  });

  Future<Either<Failure, PostEntity>> archive({String id});

  Future<Either<Failure, PostEntity>> delete({String id});

  Future<Either<Failure, PostEntity>> edit({
    String id,
    String title,
    String description,
    List<PhotoModel> gallery,
    LocationModel location,
    PetModel petInfo,
  });

  Future<Either<Failure, None>> like({String id});

  Future<Either<Failure, None>> share({String id});

  Future<Either<Failure, None>> comment({String id, CommentEntity comment});

  Future<Either<Failure, PostEntity>> getById({String id});

  Future<Either<Failure, List<PostEntity>>> getAll({FilterEntity filters});
}
