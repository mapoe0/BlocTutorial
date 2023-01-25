import 'package:tuto_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tuto_app/core/usecases/usecase.dart';
import 'package:tuto_app/features/joke/domain/entities/joke.dart';
import 'package:tuto_app/features/joke/domain/repositories/joke_repository.dart';

class JokeUsecase extends UseCase<Joke, NoParams> {
  JokeRepository jokeRepository;
  JokeUsecase({
    required this.jokeRepository,
  });

  @override
  Future<Either<Failure, Joke>> call(NoParams params) async {
    return await jokeRepository.fetchJoke();
  }
}
