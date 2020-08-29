part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class NotAuthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure(this.message);

  @override
  List<Object> get props => [message];
}
