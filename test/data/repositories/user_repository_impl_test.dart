import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mel/core.dart'
    show
        AuthenticationException,
        AuthenticationFailure,
        NetworkInfo,
        NetworkException,
        NetworkFailure,
        ServerException,
        ServerFailure,
        CacheException,
        CacheFailure;
import 'package:mel/datasources.dart'
    show UserLocalDataSource, UserRemoteDataSource;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/models.dart' show UserModel;
import 'package:mel/repositories.dart' show UserRepositoryImpl;
import 'package:mockito/mockito.dart'
    show Mock, any, verify, verifyZeroInteractions, when;

class MockRemoteDataSource extends Mock implements UserRemoteDataSource {}

class MockLocalDataSource extends Mock implements UserLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockAuthResult extends Mock implements AuthResult {}

void main() {
  UserRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockFirebaseAuth mockFirebaseAuth;
  MockNetworkInfo mockNetworkInfo;
  MockAuthResult mockAuthResult;
  MockFirebaseUser mockFirebaseUser;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockFirebaseAuth = MockFirebaseAuth();
    mockAuthResult = MockAuthResult();
    mockFirebaseUser = MockFirebaseUser();

    repository = UserRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo,
        firebaseAuth: mockFirebaseAuth);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('authenticating user', () {
    final tEmail = 'Magdalen_Thiel57@example.net';
    final tPassword = 'AFmY0QP3a0Ybdlp';
    final tUserModel = UserModel(
      userId: '1',
      firstName: 'Sigmund',
      lastName: 'Ondricka',
      email: tEmail,
    );
    final UserEntity tUser = tUserModel;

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.authenticate(tEmail, tPassword);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockFirebaseAuth.signInWithEmailAndPassword(
                  email: tEmail, password: tPassword))
              .thenAnswer((_) async => mockAuthResult);
          when(mockAuthResult.user).thenReturn(mockFirebaseUser);
          when(mockRemoteDataSource.getUserData(any))
              .thenAnswer((_) async => tUser);
          final uid = mockFirebaseUser.uid;
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          verify(mockRemoteDataSource.getUserData(uid));
          expect(result, equals(Right(tUser)));
        },
      );

      test(
        'should cache locally when the remote data return with successful',
        () async {
          // arrange
          when(mockFirebaseAuth.signInWithEmailAndPassword(
                  email: tEmail, password: tPassword))
              .thenAnswer((_) async => mockAuthResult);
          when(mockAuthResult.user).thenReturn(mockFirebaseUser);
          when(mockRemoteDataSource.getUserData(any))
              .thenAnswer((_) async => tUser);
          final uid = mockFirebaseUser.uid;
          // act
          await repository.authenticate(tEmail, tPassword);
          // assert
          verify(mockRemoteDataSource.getUserData(uid));
          verify(mockLocalDataSource.cacheUserData(tUser));
        },
      );
      test(
        'should return auth failure on invalid credentials',
        () async {
          // arrange
          when(mockFirebaseAuth.signInWithEmailAndPassword(
                  email: tEmail, password: tPassword))
              .thenThrow(AuthenticationException());
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(AuthenticationFailure())));
        },
      );
      test(
        'should return server failure on server error',
        () async {
          // arrange
          when(mockFirebaseAuth.signInWithEmailAndPassword(
                  email: tEmail, password: tPassword))
              .thenThrow(ServerException());
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    test(
      'should check if the device is offline',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        repository.authenticate(tEmail, tPassword);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOffline(() {
      test(
        'should return network failure on network error',
        () async {
          // arrange
          when(mockFirebaseAuth.signInWithEmailAndPassword(
                  email: tEmail, password: tPassword))
              .thenThrow(NetworkException());
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          expect(result, equals(Left(NetworkFailure())));
          verifyZeroInteractions(mockRemoteDataSource);
          verifyZeroInteractions(mockLocalDataSource);
        },
      );
    });
  });

  group('getting current user', () {
    final tUserModel = UserModel(
      userId: '1',
      firstName: 'Sigmund',
      lastName: 'Ondricka',
      email: "Magdalen_Thiel57@example.net",
    );
    final UserEntity tUser = tUserModel;

    test(
      'should return auth failure on auth error',
      () async {
        // arrange
        when(mockFirebaseAuth.currentUser())
            .thenThrow(AuthenticationException());
        // act
        final result = await repository.currentUser();
        // assert
        expect(result, Left(AuthenticationFailure()));
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockFirebaseAuth.currentUser())
              .thenAnswer((_) async => mockFirebaseUser);
          when(mockRemoteDataSource.getUserData(any))
              .thenAnswer((_) async => tUser);
          // act
          final result = await repository.currentUser();
          // assert
          expect(result, equals(Right(tUser)));
        },
      );
      test(
        'should cache locally when the remote data return with success',
        () async {
          // arrange
          when(mockFirebaseAuth.currentUser())
              .thenAnswer((_) async => mockFirebaseUser);
          when(mockRemoteDataSource.getUserData(any))
              .thenAnswer((_) async => tUser);
          // act
          await repository.currentUser();
          // assert
          verify(mockLocalDataSource.cacheUserData(tUser));
        },
      );
      test(
        'should return server failure on server error',
        () async {
          // arrange
          when(mockFirebaseAuth.currentUser()).thenThrow(ServerException());
          // act
          final result = await repository.currentUser();
          // assert
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, Left(ServerFailure()));
        },
      );
      test(
        'should return cache failure on cache error',
        () async {
          // arrange
          when(mockFirebaseAuth.currentUser())
              .thenAnswer((_) async => mockFirebaseUser);
          when(mockRemoteDataSource.getUserData(any))
              .thenAnswer((_) async => tUser);
          when(mockLocalDataSource.cacheUserData(tUser))
              .thenThrow(CacheException());
          // act
          final result = await repository.currentUser();
          // assert
          verify(mockLocalDataSource.cacheUserData(tUser));
          expect(result, Left(CacheFailure()));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return local data when local dara return with success',
        () async {
          // arrange
          when(mockFirebaseAuth.currentUser())
              .thenAnswer((_) async => mockFirebaseUser);
          when(mockLocalDataSource.getLastUserData())
              .thenAnswer((_) async => tUser);
          // act
          final result = await repository.currentUser();
          // assert
          expect(result, equals(Right(tUser)));
        },
      );

      test(
        'should return server failure on server error',
        () async {
          // arrange
          when(mockFirebaseAuth.currentUser()).thenThrow(ServerException());
          // act
          final result = await repository.currentUser();
          // assert
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, Left(ServerFailure()));
        },
      );
    });
  });
}
