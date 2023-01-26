import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit/joke/joke_cubit.dart';

class JokeRequestButton extends StatelessWidget {
  const JokeRequestButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          BlocProvider.of<JokeCubit>(context).requestJoke();
        },
        child: Text(text));
  }
}
