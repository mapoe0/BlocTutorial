import 'package:dartz/dartz.dart';
import 'package:tuto_app/core/error/exception.dart';

import 'package:tuto_app/core/error/failures.dart';
import 'package:tuto_app/core/network/network_info.dart';
import 'package:tuto_app/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:tuto_app/features/joke/domain/entities/joke.dart';
import 'package:tuto_app/features/joke/domain/repositories/joke_repository.dart';

class JokeRepositoryImpl implements JokeRepository {
  JokeRemoteDatasource jokeRemoteDatasource;
  NetworkInfo networkInfo;
  JokeRepositoryImpl({
    required this.jokeRemoteDatasource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Joke>> fetchJoke() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await jokeRemoteDatasource.fetchJoke());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
