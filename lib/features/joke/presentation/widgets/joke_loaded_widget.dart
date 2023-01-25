import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/joke_cubit.dart';

class JokeLoadedWidget extends StatelessWidget {
  const JokeLoadedWidget({super.key, required this.jokeValue});
  final String jokeValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(jokeValue),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<JokeCubit>(context).requestJoke();
            },
            child: Text("Charger"))
      ],
    );
  }
}
