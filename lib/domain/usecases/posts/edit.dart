import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, UseCases;
import 'package:mel/entities.dart' show PostEntity;
import 'package:mel/repositories.dart' show PostRepository;
import 'package:meta/meta.dart' show required;
import 'package:mel/models.dart' show PhotoModel, LocationModel, PetModel;

class Archive implements UseCases<PostEntity> {
  final PostRepository repository;

  Archive({@required this.repository}) : assert(repository != null);

  Future<Either<Failure, PostEntity>> call({
    @required id,
    title,
    description,
    List<PhotoModel> gallery,
    LocationModel location,
    PetModel petInfo,
  }) async {
    return await repository.edit(
        id: id,
        title: title,
        description: description,
        gallery: gallery,
        location: location,
        petInfo: petInfo);
  }
}
