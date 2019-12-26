import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show PostEntity;
import 'package:mel/repositories.dart' show PostRepository;
import 'package:meta/meta.dart' show required;

import 'package:mel/models.dart' show PhotoModel, LocationModel, PetModel;

class Create implements UseCases<PostEntity> {
  final PostRepository repository;

  Create({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, PostEntity>> call({
    @required uid,
    @required title,
    @required type,
    @required description,
    List<PhotoModel> gallery,
    @required LocationModel location,
    @required PetModel petInfo,
  }) async {
    return await repository.create(
        uid: uid,
        title: title,
        type: type,
        description: description,
        gallery: gallery,
        location: location,
        petInfo: petInfo);
  }
}
