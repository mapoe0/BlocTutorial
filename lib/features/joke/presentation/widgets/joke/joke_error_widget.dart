import 'package:flutter/material.dart';
import 'package:tuto_app/features/joke/presentation/widgets/joke/joke_request_button.dart';

class JokeErrorWidget extends StatelessWidget {
  const JokeErrorWidget({
    Key? key,
    required this.errorMsg,
  }) : super(key: key);
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(errorMsg), const JokeRequestButton(text: "Réessayer")],
    );
  }
}
