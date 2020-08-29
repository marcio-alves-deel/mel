part of 'messages_bloc.dart';

abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

class MessagesInitial extends MessagesState {}

class MessagesLoading extends MessagesState {}

class MessagesSuccess extends MessagesState {
  final List<User> messages;

  MessagesSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class MessagesFailure extends MessagesState {
  final String message;

  MessagesFailure(this.message);

  @override
  List<Object> get props => [message];
}
