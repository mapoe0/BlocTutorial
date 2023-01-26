import 'dart:convert';

import 'package:tuto_app/core/error/exception.dart';
import 'package:tuto_app/features/joke/data/models/joke_model.dart';
import 'package:http/http.dart' as http;

abstract class JokeRemoteDatasource {
  Future<JokeModel> fetchJoke();
  Future<JokeModel> fetchJokeWithCategory(String category);
}

class JokeRemoteDatasourceImpl implements JokeRemoteDatasource {
  final Uri url = Uri.parse(
      "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random");
  final String HOST = 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com';
  final String API_KEY = 'a0228bcac8msh759e880b2efc663p141273jsn890294865af8';
  @override
  Future<JokeModel> _fetchJoke(Map<String, String> headers) async {
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return JokeModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<JokeModel> fetchJoke() async {
    Map<String, String> headers = {
      'accept': 'application/json',
      'X-RapidAPI-Host': HOST,
      'X-RapidAPI-Key': API_KEY,
    };
    return await _fetchJoke(headers);
  }

  @override
  Future<JokeModel> fetchJokeWithCategory(String category) async {
    print("api call with category: " + category);
    Map<String, String> headers = {
      'accept': 'application/json',
      'X-RapidAPI-Host': HOST,
      'X-RapidAPI-Key': API_KEY,
      'category': category
    };
    return await _fetchJoke(headers);
  }
}
