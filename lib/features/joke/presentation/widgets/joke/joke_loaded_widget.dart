import 'package:flutter/material.dart';
import 'package:tuto_app/features/joke/presentation/widgets/joke/joke_request_button.dart';

class JokeLoadedWidget extends StatelessWidget {
  const JokeLoadedWidget({super.key, required this.jokeValue});
  final String jokeValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(jokeValue),
        const JokeRequestButton(
          text: "Charger",
        )
      ],
    );
  }
}
