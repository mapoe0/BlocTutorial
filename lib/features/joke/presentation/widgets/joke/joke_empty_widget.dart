import 'package:flutter/material.dart';
import 'package:tuto_app/features/joke/presentation/widgets/joke/joke_request_button.dart';

class JokeEmptyWidget extends StatelessWidget {
  const JokeEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Cliquer pour charger une blague"),
        JokeRequestButton(text: "Charger")
      ],
    );
  }
}
