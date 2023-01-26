import 'package:dartz/dartz.dart';
import 'package:tuto_app/features/joke/domain/entities/joke.dart';

import '../../../../core/error/failures.dart';

abstract class JokeRepository {
  Future<Either<Failure, Joke>> fetchJoke();
  Future<Either<Failure, Joke>> fetchJokeWithCategory(String category);
}
