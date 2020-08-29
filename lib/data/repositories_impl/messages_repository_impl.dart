import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:mel/core.dart'
    show Failure, NetworkInfo, ServerException, ServerFailure;
import 'package:mel/data.dart'
    show Message, MessagesLocalDataSource, MessagesRemoteDataSource, User;
import 'package:meta/meta.dart' show required;
import 'package:mel/domain.dart' show MessagesRepository;

class MessagesRepositoryImpl implements MessagesRepository {
  final NetworkInfo networkInfo;
  final FirebaseAuth firebaseAuth;
  final MessagesRemoteDataSource remoteDataSource;
  final MessagesLocalDataSource localDataSource;

  MessagesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.firebaseAuth,
    @required this.networkInfo,
  })  : assert(remoteDataSource != null),
        assert(localDataSource != null),
        assert(firebaseAuth != null),
        assert(networkInfo != null);

  @override
  Future<Either<Failure, List<User>>> listMessages() async {
    try {
      final user = await firebaseAuth.currentUser();
      final List<User> list = await remoteDataSource.listMessages(user.email);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Message>>> listChatMessages(String id) async {
    try {
      final List<Message> list = await remoteDataSource.listChatMessages(id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
