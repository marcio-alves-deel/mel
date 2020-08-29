import 'dart:async';
import 'package:bloc/bloc.dart' show Bloc;
import 'package:mel/core.dart'
    show
        AuthenticationFailure,
        AuthorizationFailure,
        CacheFailure,
        Failure,
        NoParams,
        ServerFailure;
import 'package:mel/data.dart' show User;
import 'package:mel/domain.dart' show SignInWithFacebook;
import 'package:meta/meta.dart' show required;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:dartz/dartz.dart' show Either;

part 'login_event.dart';
part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String AUTHORIZATION_FAILURE_MESSAGE = 'The operation has been canceled';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Error when trying to log in';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInWithFacebook _signInWithFacebook;

  LoginBloc({
    @required SignInWithFacebook signInWithFacebook,
  })  : assert(signInWithFacebook != null),
        _signInWithFacebook = signInWithFacebook;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithFacebookPressed) {
      yield* _mapLoginWithFacebookPressedToState();
    }
  }

  Stream<LoginState> _mapLoginWithFacebookPressedToState() async* {
    yield LoginLoading();
    final _signInRequest = await _signInWithFacebook(NoParams());
    yield* _eitherLoadedOrErrorState(_signInRequest);
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, User> failureOrUser,
  ) async* {
    yield failureOrUser.fold(
      (failure) => LoginFailure(_mapFailureToMessage(failure)),
      (user) => LoginSuccess(user),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case AuthorizationFailure:
        return AUTHORIZATION_FAILURE_MESSAGE;
      case AuthenticationFailure:
        return AUTHENTICATION_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
