import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tuto_app/core/error/exception.dart';
import 'package:tuto_app/core/error/failures.dart';
import 'package:tuto_app/core/network/network_info.dart';
import 'package:tuto_app/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:tuto_app/features/joke/data/models/joke_model.dart';
import 'package:tuto_app/features/joke/data/repositories/joke_repository_impl.dart';

import 'joke_repository_impl_test.mocks.dart';

class TestJokeRemoteDataSource extends Mock implements JokeRemoteDatasource {}

class TestNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([TestJokeRemoteDataSource, TestNetworkInfo])
void main() {
  late JokeRepositoryImpl jokeRepositoryImpl;
  late MockTestJokeRemoteDataSource mockTestJokeRemoteDataSource;
  late MockTestNetworkInfo mockTestNetworkInfo;
  setUp(() {
    mockTestJokeRemoteDataSource = MockTestJokeRemoteDataSource();
    mockTestNetworkInfo = MockTestNetworkInfo();
    jokeRepositoryImpl = JokeRepositoryImpl(
        jokeRemoteDatasource: mockTestJokeRemoteDataSource,
        networkInfo: mockTestNetworkInfo);
  });
  void runTestOnline(Function body) {
    group("device is online", (() {
      setUp(() {
        when(mockTestNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    }));
  }

  group("fetch joke", (() {
    final tJokeModel = JokeModel(id: "0125", value: "j'ai peté");
    runTestOnline(() {
      test(
        'should get return a joke when call to datasource is successfull',
        () async {
          //arrange
          when(mockTestJokeRemoteDataSource.fetchJoke())
              .thenAnswer((_) async => tJokeModel);
          //act
          final result = await jokeRepositoryImpl.fetchJoke();
          //assert
          verify(mockTestJokeRemoteDataSource.fetchJoke());
          expect(result, Right(tJokeModel));
        },
      );
      test(
        'should return server failure when call remote datasource is not successfull',
        () async {
          //arrange
          when(mockTestJokeRemoteDataSource.fetchJoke())
              .thenThrow(ServerException());
          //act
          final result = await jokeRepositoryImpl.fetchJoke();
          //assert
          verify(mockTestJokeRemoteDataSource.fetchJoke());
          // verifyZeroInteractions(mockTestJokeRemoteDataSource);
          expect(result, Left(ServerFailure()));
        },
      );
    });
  }));
}
