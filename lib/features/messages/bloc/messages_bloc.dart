import 'dart:async';
import 'package:bloc/bloc.dart' show Bloc;
import 'package:mel/core.dart'
    show CacheFailure, Failure, NoParams, ServerFailure;
import 'package:mel/data.dart' show MessageItem, User;
import 'package:mel/domain.dart' show ListMessages;
import 'package:meta/meta.dart' show required;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:dartz/dartz.dart' show Either;

part 'messages_event.dart';
part 'messages_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String AUTHORIZATION_FAILURE_MESSAGE = 'The operation has been canceled';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Error when trying to log in';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final ListMessages _listMessages;

  MessagesBloc({
    @required ListMessages listMessages,
  })  : assert(listMessages != null),
        _listMessages = listMessages;

  @override
  MessagesState get initialState => MessagesInitial();

  @override
  Stream<MessagesState> mapEventToState(MessagesEvent event) async* {
    if (event is MessagesStarted) {
      yield* _mapMessagesStartedToState();
    }
  }

  Stream<MessagesState> _mapMessagesStartedToState() async* {
    final messagesResponse = await _listMessages(NoParams());
    yield* _eitherLoadedOrErrorState(messagesResponse);
  }

  Stream<MessagesState> _eitherLoadedOrErrorState(
    Either<Failure, List<User>> failureOrUser,
  ) async* {
    yield failureOrUser.fold(
      (failure) => MessagesFailure(_mapFailureToMessage(failure)),
      (messages) => MessagesSuccess(messages),
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
