import 'dart:async';
import 'package:bloc/bloc.dart' show Bloc;
import 'package:mel/core.dart'
    show CacheFailure, Failure, NoParams, ServerFailure;
import 'package:mel/data.dart' show Message;
import 'package:mel/domain.dart' show ListChatMessages;
import 'package:meta/meta.dart' show required;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:dartz/dartz.dart' show Either;

part 'chat_event.dart';
part 'chat_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String AUTHORIZATION_FAILURE_MESSAGE = 'The operation has been canceled';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Error when trying to log in';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ListChatMessages _listChat;

  ChatBloc({
    @required ListChatMessages listChat,
  })  : assert(listChat != null),
        _listChat = listChat;

  @override
  ChatState get initialState => ChatInitial();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    print(event);
    if (event is ChatStarted) {
      yield* _mapChatStartedToState();
    }
  }

  Stream<ChatState> _mapChatStartedToState() async* {
    final messagesResponse = await _listChat(NoParams());
    yield* _eitherLoadedOrErrorState(messagesResponse);
  }

  Stream<ChatState> _eitherLoadedOrErrorState(
    Either<Failure, List<Message>> failureOrUser,
  ) async* {
    yield failureOrUser.fold(
      (failure) => ChatFailure(_mapFailureToMessage(failure)),
      (messages) {
        print(messages);
        return ChatSuccess(messages);
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
