import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mel/controllers.dart';
import 'package:mel/datasources.dart';
import 'package:mel/repositories.dart';
import 'package:mel/usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory(
    () => AuthController(
      fAuth: di(),
      gAuth: di(),
      current: di(),
    ),
  );

  di.registerLazySingleton(() => GoogleAuth(di()));
  di.registerLazySingleton(() => FacebookAuth(di()));
  di.registerLazySingleton(() => Current(di()));

  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      firebaseAuth: di(),
      localDataSource: di(),
      networkInfo: di(),
      remoteDataSource: di(),
    ),
  );

  di.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(firestore: di()),
  );
  di.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: di()),
  );

  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(di()),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
  di.registerLazySingleton(() => Firestore());
  di.registerLazySingleton(() => FirebaseAuth.instance);
  di.registerLazySingleton(() => DataConnectionChecker());
}
