import 'dart:async';
import 'package:bloc/bloc.dart' show Bloc;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:mel/core.dart'
    show CacheFailure, Failure, NoParams, ServerFailure;
import 'package:mel/domain.dart' show IsSignedIn, SignOut;
import 'package:meta/meta.dart' show required;

part 'authentication_event.dart';
part 'authentication_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Authentication Error';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IsSignedIn _isSignedIn;
  final SignOut _signOut;

  AuthenticationBloc({
    @required IsSignedIn isSignedIn,
    @required SignOut signOut,
  })  : assert(isSignedIn != null),
        assert(signOut != null),
        _isSignedIn = isSignedIn,
        _signOut = signOut;

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapAuthenticationLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    final isSignedIn = await _isSignedIn(NoParams());

    yield* isSignedIn.fold(
      (failure) async* {
        yield AuthenticationFailure(_mapFailureToMessage(failure));
      },
      (resp) async* {
        if (!resp)
          yield NotAuthenticated();
        else
          yield AuthenticationSuccess();
      },
    );
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    yield AuthenticationSuccess();
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedOutToState() async* {
    final signOutResult = await _signOut(NoParams());

    yield* signOutResult.fold((failure) async* {
      yield AuthenticationFailure(
        _mapFailureToMessage(failure),
      );
    }, (_) async* {
      yield NotAuthenticated();
    });
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
