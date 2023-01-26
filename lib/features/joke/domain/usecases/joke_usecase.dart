import 'package:equatable/equatable.dart';
import 'package:tuto_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tuto_app/core/usecases/usecase.dart';
import 'package:tuto_app/features/joke/domain/entities/joke.dart';
import 'package:tuto_app/features/joke/domain/repositories/joke_repository.dart';

class JokeUsecase extends UseCase<Joke, JokeParams> {
  JokeRepository jokeRepository;
  JokeUsecase({
    required this.jokeRepository,
  });

  @override
  Future<Either<Failure, Joke>> call(JokeParams params) async {
    print("use case: ${params.category}");
    if (params.category == null) {
      return await jokeRepository.fetchJoke();
    } else {
      return await jokeRepository.fetchJokeWithCategory(params.category!);
    }
  }
}

class JokeParams extends Equatable {
  String? category;
  JokeParams({
    this.category,
  });

  @override
  List<Object?> get props => [category];
}
