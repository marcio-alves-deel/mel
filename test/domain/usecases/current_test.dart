import 'package:dartz/dartz.dart';
import 'package:mel/models.dart';
import 'package:mel/repositories.dart' show UserRepository;
import 'package:flutter_test/flutter_test.dart';
import 'package:mel/usecases.dart' show Current;
import 'package:mockito/mockito.dart' show Mock, verify, when;

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  Current usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = Current(repository: mockUserRepository);
  });

  final tUserModel = UserModel(
    uid: '1',
    firstName: 'Sigmund',
    lastName: 'Ondricka',
    email: 'Abel_Kerluke@hotmail.com',
  );

  test('should return current user', () async {
    when(mockUserRepository.current())
        .thenAnswer((_) async => Right(tUserModel));

    final result = await usecase();

    expect(result, Right(tUserModel));
    verify(mockUserRepository.current());
  });
}
