import 'package:dartz/dartz.dart';
import 'package:tuto_app/core/error/exception.dart';

import 'package:tuto_app/core/error/failures.dart';
import 'package:tuto_app/core/network/network_info.dart';
import 'package:tuto_app/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:tuto_app/features/joke/data/models/joke_model.dart';
import 'package:tuto_app/features/joke/domain/entities/joke.dart';
import 'package:tuto_app/features/joke/domain/repositories/joke_repository.dart';

typedef _FetchJokeChooser = Future<JokeModel> Function();

class JokeRepositoryImpl implements JokeRepository {
  JokeRemoteDatasource jokeRemoteDatasource;
  NetworkInfo networkInfo;
  JokeRepositoryImpl({
    required this.jokeRemoteDatasource,
    required this.networkInfo,
  });
  Future<Either<Failure, Joke>> _fetchJoke(
      _FetchJokeChooser _fetchJokeChooser) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await _fetchJokeChooser());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Joke>> fetchJoke() async {
    return await _fetchJoke(() => jokeRemoteDatasource.fetchJoke());
  }

  @override
  Future<Either<Failure, Joke>> fetchJokeWithCategory(String category) async {
    return await _fetchJoke(
        () => jokeRemoteDatasource.fetchJokeWithCategory(category));
  }
}
