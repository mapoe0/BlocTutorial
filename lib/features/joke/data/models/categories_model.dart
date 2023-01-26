import 'package:tuto_app/features/joke/domain/entities/categories.dart';

class CatagoriesModel extends Categories {
  CatagoriesModel({required super.categories});

  factory CatagoriesModel.fromJson(List<dynamic> json) {
    // categories = (map['categories'] as List)?.map((item) => item as String)?.toList();

    return CatagoriesModel(
        categories: json.map((item) => item.toString()).toList());
  }
}
