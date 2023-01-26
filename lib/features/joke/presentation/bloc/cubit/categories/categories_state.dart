part of 'categories_cubit.dart';

enum CategoriesStatus { empty, loading, loaded, errror }

class CategoriesState extends Equatable {
  const CategoriesState({
    required this.categoriesStatus,
    this.categories,
    this.errorMsg,
  });
  final CategoriesStatus categoriesStatus;
  final Categories? categories;
  final String? errorMsg;
  factory CategoriesState.empty() {
    return const CategoriesState(categoriesStatus: CategoriesStatus.empty);
  }
  @override
  List<Object?> get props => [categoriesStatus, categories, errorMsg];

  @override
  String toString() =>
      'CategoriesState(categoriesStatus: $categoriesStatus, categories: $categories, errorMsg: $errorMsg)';

  CategoriesState copyWith({
    CategoriesStatus? categoriesStatus,
    Categories? categories,
    String? errorMsg,
  }) {
    return CategoriesState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
