part of 'messages_bloc.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class MessagesStarted extends MessagesEvent {}

class MessagesLoaded extends MessagesEvent {}
