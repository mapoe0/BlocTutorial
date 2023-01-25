import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tuto_app/core/usecases/usecase.dart';
import 'package:tuto_app/features/joke/domain/entities/joke.dart';
import 'package:tuto_app/features/joke/domain/repositories/joke_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:tuto_app/features/joke/domain/usecases/joke_usecase.dart';

import 'joke_usecase_test.mocks.dart';

class TestJokeRepository extends Mock implements JokeRepository {}

@GenerateMocks([TestJokeRepository])
void main() {
  late final JokeUsecase jokeUsecase;
  late final MockTestJokeRepository mockTestJokeRepository;

  // setUp = init les variables avant le début des test
  setUp(() {
    mockTestJokeRepository = MockTestJokeRepository();
    jokeUsecase = JokeUsecase(jokeRepository: mockTestJokeRepository);
  });
  final tJoke = Joke(id: '', value: 'anus');

  // groupe de test
  group('Successfull test', () {
    test(
      'should get joke from the repository',
      () async {
        //arrange
        when(mockTestJokeRepository.fetchJoke())
            .thenAnswer((_) async => Right(tJoke));
        //act
        final result = await jokeUsecase(NoParams());
        //assert
        verify(mockTestJokeRepository.fetchJoke());
        verifyNoMoreInteractions(mockTestJokeRepository);
        expect(result, Right(tJoke));
      },
    );
  });
}
