import 'package:dartz/dartz.dart';
import 'package:mel/models.dart' show UserModel;
import 'package:mel/repositories.dart' show UserRepository;
import 'package:flutter_test/flutter_test.dart';
import 'package:mel/usecases.dart' show SignIn;
import 'package:mockito/mockito.dart' show Mock, any, verify, when;
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  SignIn usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = SignIn(mockUserRepository);
  });

  final tEmail = 'Sarah_Beatty@yahoo.com';
  final tPassword = '12345';
  final tUserModel = UserModel(
    userId: '1',
    firstName: 'Sigmund',
    lastName: 'Ondricka',
    email: tEmail,
  );

  test('should sign in user', () async {
    when(mockUserRepository.authenticate(any, any))
        .thenAnswer((_) async => Right(tUserModel));

    final result = await usecase(email: tEmail, password: tPassword);

    expect(result, Right(tUserModel));
    verify(mockUserRepository.authenticate(tEmail, tPassword));
  });
}
