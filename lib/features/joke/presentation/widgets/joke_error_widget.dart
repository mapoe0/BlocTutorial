import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_app/features/joke/presentation/bloc/cubit/joke_cubit.dart';

class JokeErrorWidget extends StatelessWidget {
  const JokeErrorWidget({
    Key? key,
    required this.errorMsg,
  }) : super(key: key);
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorMsg),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<JokeCubit>(context).requestJoke();
            },
            child: const Text("Réessayer"))
      ],
    );
  }
}
