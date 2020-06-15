import 'package:equatable/equatable.dart';
import 'package:mel/models.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [].obs.value;
}

class Empty extends AuthState {}

class Loading extends AuthState {}

class Loaded extends AuthState {
  final UserModel user;

  Loaded({@required this.user});

  @override
  List<Object> get props => [user].obs.value;
}

class Error extends AuthState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message].obs.value;
}
