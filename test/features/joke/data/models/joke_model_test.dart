import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:tuto_app/features/joke/data/models/joke_model.dart';
import 'package:tuto_app/features/joke/domain/entities/joke.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
  final tJokeModel = JokeModel(
      id: 'yevZ1C6IQViUoVvD6gM8Ng',
      value:
          "There's no life on Mars because Chuck Norris have already been there.");
  test('sould be a subclass of joke entity', () {
    expect(tJokeModel, isA<Joke>());
  });
  group("fromJson", () {
    test(
      'should return a JokeModel fromJson object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('joke.json'));
        //act
        final result = JokeModel.fromJson(jsonMap);
        //assert
        expect(result, tJokeModel);
      },
    );
  });
}
