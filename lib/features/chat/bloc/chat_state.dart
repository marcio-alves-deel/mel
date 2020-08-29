part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final List<Message> messages;

  ChatSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatFailure extends ChatState {
  final String message;

  ChatFailure(this.message);

  @override
  List<Object> get props => [message];
}
