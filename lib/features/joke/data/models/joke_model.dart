import 'package:tuto_app/features/joke/domain/entities/joke.dart';

class JokeModel extends Joke {
  JokeModel({required super.id, required super.value});
  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(id: json['id'], value: json['value']);
  }
}
