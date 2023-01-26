import 'dart:convert';

import 'package:tuto_app/core/error/exception.dart';
import 'package:tuto_app/features/joke/data/models/categories_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoriesDatasource {
  Future<CatagoriesModel> fetchCategories();
}

class CategoriesRemoteDatasourceImpl implements CategoriesDatasource {
  final Uri url = Uri.parse(
      "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/categories");
  final String HOST = 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com';
  final String API_KEY = 'a0228bcac8msh759e880b2efc663p141273jsn890294865af8';
  @override
  Future<CatagoriesModel> fetchCategories() async {
    Map<String, String> headers = {
      'accept': 'application/json',
      'X-RapidAPI-Host': HOST,
      'X-RapidAPI-Key': API_KEY
    };
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return CatagoriesModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
