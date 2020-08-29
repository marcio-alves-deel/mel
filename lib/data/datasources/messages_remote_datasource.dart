import 'package:mel/data.dart' show Message, MessageItem, User;
import 'package:meta/meta.dart' show required;
import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, DocumentSnapshot, Firestore, QuerySnapshot;

abstract class MessagesRemoteDataSource {
  Future<List<User>> listMessages(String id);
  Future<List<Message>> listChatMessages(String id);
}

const MESSAGES_DATA_PATH = 'messages';

class MessagesRemoteDataSourceImpl implements MessagesRemoteDataSource {
  final Firestore firestore;

  MessagesRemoteDataSourceImpl({@required this.firestore})
      : assert(firestore != null);

  @override
  Future<List<User>> listMessages(String id) async {
    final List<User> messageList = [];
    final QuerySnapshot snapshot =
        await firestore.collection(MESSAGES_DATA_PATH).getDocuments();

    snapshot.documents.forEach((result) {
      var user = User.fromJson(result.data);
      print(user);
      if (user.email != id) messageList.add(user);
      return null;
    });

    return messageList;
  }

  @override
  Future<List<Message>> listChatMessages(String id) async {
    List<Message> messageList = [];
    final QuerySnapshot snapshot = await firestore
        .collection(MESSAGES_DATA_PATH)
        .document(id)
        .collection('chats')
        .document('marcio.welben@gmail.com')
        .collection('chat_messages')
        .orderBy('createdAt', descending: false)
        .limit(20)
        .getDocuments();

    snapshot.documents.forEach((result) {
      Message message = Message.fromJson(result.data);
      messageList.add(message);
    });

    // messageList
    //     .sort((a, b) => a.createdAt.difference(b.createdAt).is);

    return messageList;
  }

  // @override
  // Future<List<MessageItem>> listMessages(String id) async {
  //   final List<MessageItem> messageList = [];
  //   final QuerySnapshot snapshot = await firestore
  //       .collection(MESSAGES_DATA_PATH)
  //       .where('user', isEqualTo: id)
  //       .orderBy('lastModificationAt')
  //       .getDocuments();

  //   snapshot.documents.forEach((result) {
  //     print(result);
  //     result.data.map((key, value) => null);
  //   });

  //   return messageList;
  // }
}
