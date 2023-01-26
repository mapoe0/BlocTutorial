import 'package:tuto_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tuto_app/core/usecases/usecase.dart';
import 'package:tuto_app/features/joke/domain/entities/categories.dart';
import 'package:tuto_app/features/joke/domain/repositories/categories_repository.dart';

class CategoriesUsecase extends UseCase<Categories, NoParams> {
  CategoriesRepository categoriesRepository;
  CategoriesUsecase({
    required this.categoriesRepository,
  });

  @override
  Future<Either<Failure, Categories>> call(NoParams params) async {
    return await categoriesRepository.fetchCategories();
  }
}
