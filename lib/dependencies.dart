import 'package:cloud_firestore/cloud_firestore.dart' show Firestore;
import 'package:data_connection_checker/data_connection_checker.dart'
    show DataConnectionChecker;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter_facebook_login/flutter_facebook_login.dart'
    show FacebookLogin;
import 'package:mel/data.dart'
    show
        AuthLocalDataSource,
        AuthLocalDataSourceImpl,
        AuthRemoteDataSource,
        AuthRemoteDataSourceImpl,
        AuthRepositoryImpl,
        MessagesLocalDataSource,
        MessagesLocalDataSourceImpl,
        MessagesRemoteDataSource,
        MessagesRemoteDataSourceImpl;

import 'package:mel/domain.dart'
    show
        AuthRepository,
        GetCurrent,
        IsSignedIn,
        ListChatMessages,
        ListMessages,
        MessagesRepository,
        SignInWithFacebook,
        SignOut;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import 'core.dart' show NetworkInfo, NetworkInfoImpl;
import 'data/repositories_impl/messages_repository_impl.dart';
import 'features/authentication.dart' show AuthenticationBloc;
import 'features/chat.dart' show ChatBloc;
import 'features/home.dart' show HomeBloc;
import 'features/login.dart' show LoginBloc;
import 'package:get_it/get_it.dart';
import 'features/messages.dart' show MessagesBloc;

final di = GetIt.instance;

Future<void> init() async {
  // Login Bloc
  di.registerFactory(
    () => LoginBloc(
      signInWithFacebook: di(),
    ),
  );

  // Auth Bloc
  di.registerFactory(
    () => AuthenticationBloc(
      isSignedIn: di(),
      signOut: di(),
    ),
  );

// Home
  di.registerFactory(
    () => HomeBloc(
      getCurrent: di(),
    ),
  );

//
  di.registerFactory(
    () => MessagesBloc(
      listMessages: di(),
    ),
  );

  //
  di.registerFactory(
    () => ChatBloc(
      listChat: di(),
    ),
  );

  // UseCases
  di.registerLazySingleton(() => SignInWithFacebook(di()));
  di.registerLazySingleton(() => IsSignedIn(di()));
  di.registerLazySingleton(() => SignOut(di()));
  di.registerLazySingleton(() => GetCurrent(di()));
  di.registerLazySingleton(() => ListMessages(di()));
  di.registerLazySingleton(() => ListChatMessages(di()));

  // Repositories
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuth: di(),
      localDataSource: di(),
      networkInfo: di(),
      remoteDataSource: di(),
      facebookLogin: di(),
    ),
  );
  di.registerLazySingleton<MessagesRepository>(
    () => MessagesRepositoryImpl(
      firebaseAuth: di(),
      localDataSource: di(),
      networkInfo: di(),
      remoteDataSource: di(),
    ),
  );

  // Data sources
  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firestore: di()),
  );
  di.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: di()),
  );

  di.registerLazySingleton<MessagesRemoteDataSource>(
    () => MessagesRemoteDataSourceImpl(firestore: di()),
  );
  di.registerLazySingleton<MessagesLocalDataSource>(
    () => MessagesLocalDataSourceImpl(sharedPreferences: di()),
  );

  // Network check
  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(di()),
  );

  // Others
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
  di.registerLazySingleton(() => Firestore());
  di.registerLazySingleton(() => FirebaseAuth.instance);
  di.registerLazySingleton(() => DataConnectionChecker());
  di.registerLazySingleton(() => FacebookLogin());
}
