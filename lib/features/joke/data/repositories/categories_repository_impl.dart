import 'package:dartz/dartz.dart';
import 'package:tuto_app/core/error/exception.dart';

import 'package:tuto_app/core/error/failures.dart';
import 'package:tuto_app/core/network/network_info.dart';
import 'package:tuto_app/features/joke/data/datasources/categories_remote_datasource.dart';
import 'package:tuto_app/features/joke/domain/entities/categories.dart';
import 'package:tuto_app/features/joke/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesDatasource categoriesDatasource;
  NetworkInfo networkInfo;
  CategoriesRepositoryImpl({
    required this.categoriesDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Categories>> fetchCategories() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await categoriesDatasource.fetchCategories());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
