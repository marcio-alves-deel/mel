import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mel/core.dart'
    show
        AuthenticationException,
        AuthenticationFailure,
        Failure,
        NetworkInfo,
        ServerException,
        ServerFailure;
import 'package:mel/datasources.dart'
    show UserLocalDataSource, UserRemoteDataSource;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/models.dart' show UserModel;
import 'package:mel/providers.dart';
import 'package:mel/repositories.dart' show UserRepositoryImpl;
import 'package:mockito/mockito.dart' show Mock, any, verify, when;

class MockRemoteDataSource extends Mock implements UserRemoteDataSource {}

class MockLocalDataSource extends Mock implements UserLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockUserAuthProvider extends Mock implements UserAuthProviderImpl {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  UserRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockUserAuthProvider mockUserAuthProvider;
  MockFirebaseUser mockFirebaseUser;

  final tEmail = 'Magdalen_Thiel57@example.net';
  final tPassword = 'AFmY0QP3a0Ybdlp';
  final tUserModel = UserModel(
    userId: '1',
    firstName: 'Sigmund',
    lastName: 'Ondricka',
    email: tEmail,
  );

  final UserEntity tUser = tUserModel;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockUserAuthProvider = MockUserAuthProvider();
    mockFirebaseUser = MockFirebaseUser();

    repository = UserRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      userAuthProvider: mockUserAuthProvider,
    );
  });
  test('should return a user when sign in is successful', () async {
    when(mockUserAuthProvider.signInWithEmailAndPassword(any, any))
        .thenAnswer((_) async => mockFirebaseUser);
    when(mockRemoteDataSource.getUserData('1')).thenAnswer((_) async => tUser);
    when(repository.authenticate(any, any))
        .thenAnswer((_) async => Right(tUser));

    final result = await repository.authenticate(tEmail, tPassword);

    expect(result, Right(tUser));
  });
}
