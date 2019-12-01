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
import 'package:mockito/mockito.dart'
    show Mock, any, verify, verifyZeroInteractions, when;

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

  setUpAll(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockUserAuthProvider = MockUserAuthProvider();

    repository = UserRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      userAuthProvider: mockUserAuthProvider,
    );
  });

  group('signIn', () {
    final tEmail = 'Magdalen_Thiel57@example.net';
    final tPassword = 'AFmY0QP3a0Ybdlp';
    final tUserModel = UserModel(
      userId: '1',
      firstName: 'Sigmund',
      lastName: 'Ondricka',
      email: tEmail,
    );
    final UserEntity tUser = tUserModel;

    group('connected device', () {
      setUp(() {
        mockFirebaseUser = MockFirebaseUser();

        when(mockUserAuthProvider.signInWithEmailAndPassword(tEmail, tPassword))
            .thenAnswer((_) async => mockFirebaseUser);
        when(mockRemoteDataSource.getUserData('1'))
            .thenAnswer((_) => Future<UserEntity>.value(tUser));
        when(repository.authenticate(tEmail, tPassword))
            .thenAnswer((_) async => Right(tUser));
      });
      test('should return a user when sign in is successful', () async {
        expect(await repository.authenticate(tEmail, tPassword),
            const TypeMatcher<UserEntity>());
        // expect(result, Right(tUser));
      });
    });

    // group('device is connected', () {
    //   // setUp(() {
    //   //   when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    //   // });
    //   test('should return a user when sign in is successful', () async {
    //     when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    //     when(mockFirebaseAuth.signInWithEmailAndPassword(
    //             email: tEmail, password: tPassword))
    //         .thenAnswer((_) => Future<MockAuthResult>.value(mockAuthResult));

    //     when(repository.authenticate(tEmail, tPassword))
    //         .thenAnswer((_) async => Right(tUser));

    //     when(mockRemoteDataSource.getUserData(any))
    //         .thenAnswer((_) async => Future<UserModel>.value(tUserModel));

    //     final result = await repository.authenticate(tEmail, tPassword);
    //     // verify(repository.authenticate(tEmail, tPassword));

    //     expect(result, equals(Right(tUser)));
    //   });

    // test('should return error with incorrect credentials', () async {
    //   when(repository.authenticate(any, any))
    //       .thenThrow(AuthenticationException);

    //   final result = await repository.authenticate(tEmail, tPassword);

    //   verify(repository.authenticate(tEmail, tPassword));
    //   expect(result, equals(Left(AuthenticationFailure())));
    // }, skip: true);

    // group('current user', () {
    //   test(
    //       'should return User data when call to remote data source is successful',
    //       () async {
    //     when(repository.currentUser())
    //         .thenAnswer((_) async => Right(tUserModel));

    //     final result = await repository.currentUser();

    //     verify(repository.currentUser());
    //     expect(result, equals(Right(tUser)));
    //   });

    //   test('should return error when call to remote data source fails',
    //       () async {
    //     when(repository.currentUser()).thenThrow(ServerException());

    //     final result = await repository.currentUser();

    //     verify(repository.currentUser());
    //     verifyZeroInteractions(mockLocalDataSource);
    //     expect(result, equals(Left(ServerFailure())));
    //   });
    // }, skip: true);
    // });

    //   group('device is not connected', () {
    //     setUp(() {
    //       when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    //     });

    //     test('should return last cached data when data is present', () async {});
    //   });
  });
}
