import 'package:dartz/dartz.dart';
import 'package:mel/repositories.dart' show UserRepository;
import 'package:flutter_test/flutter_test.dart';
import 'package:mel/usecases.dart' show SignOut;
import 'package:mockito/mockito.dart' show Mock, verify, when;

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  SignOut usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = SignOut(repository: mockUserRepository);
  });

  test('should sign out user', () async {
    when(mockUserRepository.signOut()).thenAnswer((_) async => Right(null));

    final result = await usecase();

    expect(result, Right(null));
    verify(mockUserRepository.signOut());
  });
}
