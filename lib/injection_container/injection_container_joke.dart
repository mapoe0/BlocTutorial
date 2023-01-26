import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tuto_app/core/network/network_info.dart';
import 'package:tuto_app/features/joke/data/datasources/categories_remote_datasource.dart';
import 'package:tuto_app/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:tuto_app/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:tuto_app/features/joke/domain/repositories/joke_repository.dart';
import 'package:tuto_app/features/joke/domain/usecases/joke_usecase.dart';

import '../features/joke/data/repositories/categories_repository_impl.dart';
import '../features/joke/domain/repositories/categories_repository.dart';
import '../features/joke/domain/usecases/categories_usecase.dart';
import '../features/joke/presentation/bloc/cubit/categories/categories_cubit.dart';
import '../features/joke/presentation/bloc/cubit/joke/joke_cubit.dart';

Future<void> initJoke(GetIt sl) async {
  // Features: Joke
  // [BLOC]
  sl.registerFactory(() => JokeCubit(jokeUsecase: sl()));
  sl.registerFactory(() => CategoriesCubit(categoriesUsecase: sl()));

  // [USE CASE]
  sl.registerLazySingleton(() => JokeUsecase(jokeRepository: sl()));
  sl.registerLazySingleton(() => CategoriesUsecase(categoriesRepository: sl()));

  // [REPOSITORY]
  sl.registerLazySingleton<JokeRepository>(
      () => JokeRepositoryImpl(jokeRemoteDatasource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CategoriesRepository>(() =>
      CategoriesRepositoryImpl(categoriesDatasource: sl(), networkInfo: sl()));

  // [DATASOURCE]
  sl.registerLazySingleton<JokeRemoteDatasource>(
      () => JokeRemoteDatasourceImpl());
  sl.registerLazySingleton<CategoriesDatasource>(
      () => CategoriesRemoteDatasourceImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //Eternal
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
