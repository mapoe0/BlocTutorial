import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_app/features/joke/presentation/bloc/cubit/joke_cubit.dart';

class JokeEmptyWidget extends StatelessWidget {
  const JokeEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Cliquer pour charger une blague"),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<JokeCubit>(context).requestJoke();
            },
            child: Text("Charger"))
      ],
    );
  }
}
