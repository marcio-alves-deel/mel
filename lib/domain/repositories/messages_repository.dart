import 'package:dartz/dartz.dart' show Either;
import 'package:mel/core.dart' show Failure;
import 'package:mel/data.dart' show Message, User;

abstract class MessagesRepository {
  Future<Either<Failure, List<User>>> listMessages();
  Future<Either<Failure, List<Message>>> listChatMessages(String id);
}
