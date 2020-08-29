part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStarted extends LoginEvent {}

class LoginWithGooglePressed extends LoginEvent {}

class LoginWithFacebookPressed extends LoginEvent {}
