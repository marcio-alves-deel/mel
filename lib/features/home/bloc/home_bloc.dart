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
import 'package:mel/domain.dart' show GetCurrent;
import 'package:meta/meta.dart' show required;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:dartz/dartz.dart' show Either;

part 'home_event.dart';
part 'home_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String AUTHORIZATION_FAILURE_MESSAGE = 'The operation has been canceled';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Error when trying to log in';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrent _getCurrent;

  HomeBloc({
    @required GetCurrent getCurrent,
  })  : assert(getCurrent != null),
        _getCurrent = getCurrent;

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeStarted) {
      yield* _mapHomeStartedToState();
    }
  }

  Stream<HomeState> _mapHomeStartedToState() async* {
    final currentResponse = await _getCurrent(NoParams());
    yield* _eitherLoadedOrErrorState(currentResponse);
  }

  Stream<HomeState> _eitherLoadedOrErrorState(
    Either<Failure, User> failureOrUser,
  ) async* {
    yield failureOrUser.fold(
      (failure) => HomeFailure(_mapFailureToMessage(failure)),
      (user) => HomeSuccess(user),
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
