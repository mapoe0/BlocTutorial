import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tuto_app/core/usecases/usecase.dart';

import 'package:tuto_app/features/joke/domain/entities/categories.dart';
import 'package:tuto_app/features/joke/domain/usecases/categories_usecase.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesUsecase categoriesUsecase;
  CategoriesCubit({required this.categoriesUsecase})
      : super(CategoriesState.empty());

  void requestMenu() async {
    emit(state.copyWith(categoriesStatus: CategoriesStatus.loading));
    final useCaseResponse = await categoriesUsecase(NoParams());
    useCaseResponse.fold(
        (failure) => emit(state.copyWith(
            categoriesStatus: CategoriesStatus.errror,
            errorMsg: "Erreur de chargement")),
        (categories) => emit(state.copyWith(
            categoriesStatus: CategoriesStatus.loaded,
            categories: categories)));
  }
}
