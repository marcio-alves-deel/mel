import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:flutter_test/flutter_test.dart';
import 'package:mel/usecases.dart' show Register;
import 'package:mockito/mockito.dart' show Mock, any, verify, when;

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  Register usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = Register(repository: mockUserRepository);
  });

  final tEmail = 'Gunnar3@hotmail.com';
  final tPassword = 'tp0CpcYS7jQMfiF';
  final tFirstName = 'Ramona';
  final tLastName = 'Swift';
  final tBirthDate = new DateTime.now().toString();
  final tAvatar =
      'data:image/svg+xml;charset=UTF-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20baseProfile%3D%22full%22%20width%3D%22undefined%22%20height%3D%22undefined%22%3E%20%3Crect%20width%3D%22100%25%22%20height%3D%22100%25%22%20fill%3D%22grey%22%2F%3E%20%20%3Ctext%20x%3D%220%22%20y%3D%2220%22%20font-size%3D%2220%22%20text-anchor%3D%22start%22%20fill%3D%22white%22%3Eundefinedxundefined%3C%2Ftext%3E%20%3C%2Fsvg%3E';

  final tUser = UserEntity(
    uid: '1',
    email: tEmail,
    firstName: tFirstName,
    lastName: tLastName,
    birthDate: tBirthDate,
    avatar: tAvatar,
  );

  test('should create new user', () async {
    when(mockUserRepository.register(
      email: any,
      firstName: any,
      lastName: any,
      password: any,
      birthDate: any,
      avatar: any,
    )).thenAnswer((_) async => Right(tUser));

    final result = await usecase(
        email: tEmail,
        password: tPassword,
        firstName: tFirstName,
        lastName: tLastName,
        birthDate: tBirthDate,
        avatar: tAvatar);

    expect(result, Right(tUser));
    verify(mockUserRepository.register(
      email: tEmail,
      password: tPassword,
      firstName: tFirstName,
      lastName: tLastName,
      birthDate: tBirthDate,
      avatar: tAvatar,
    ));
  });
}
