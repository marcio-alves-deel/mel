import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure, NoParams, UseCase;
import 'package:mel/data.dart' show Message, User;
import 'package:mel/domain.dart' show MessagesRepository;

class ListChatMessages implements UseCase<List<Message>, NoParams> {
  final MessagesRepository repository;

  ListChatMessages(this.repository);

  @override
  Future<Either<Failure, List<Message>>> call(NoParams params) async {
    return await repository.listChatMessages('tawanyvilar@gmail.com');
  }
}
