import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, NoParams, UseCase;
import 'package:mel/data.dart' show MessageItem, User;
import 'package:mel/domain.dart' show MessagesRepository;

class ListMessages implements UseCase<List<User>, NoParams> {
  final MessagesRepository repository;

  ListMessages(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await repository.listMessages();
  }
}
