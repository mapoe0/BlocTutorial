import 'package:dartz/dartz.dart';
import 'package:tuto_app/features/joke/domain/entities/categories.dart';

import '../../../../core/error/failures.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, Categories>> fetchCategories();
}
