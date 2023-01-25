import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tuto_app/core/network/network_info.dart';
import 'package:tuto_app/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:tuto_app/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:tuto_app/features/joke/domain/repositories/joke_repository.dart';
import 'package:tuto_app/features/joke/domain/usecases/joke_usecase.dart';
import 'package:tuto_app/features/joke/presentation/bloc/cubit/joke_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Features: Joke
  // Bloc
  sl.registerFactory(() => JokeCubit(jokeUsecase: sl()));

  //Use case
  sl.registerLazySingleton(() => JokeUsecase(jokeRepository: sl()));

  // repository
  sl.registerLazySingleton<JokeRepository>(
      () => JokeRepositoryImpl(jokeRemoteDatasource: sl(), networkInfo: sl()));
  // datasource
  sl.registerLazySingleton<JokeRemoteDatasource>(
      () => JokeRemoteDatasourceImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //Eternal
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
