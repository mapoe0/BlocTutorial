import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_app/features/joke/presentation/bloc/cubit/joke_cubit.dart';
import 'package:tuto_app/features/joke/presentation/widgets/joke_empty_widget.dart';
import 'package:tuto_app/features/joke/presentation/widgets/joke_error_widget.dart';
import 'package:tuto_app/features/joke/presentation/widgets/joke_loaded_widget.dart';
import 'package:tuto_app/injection_container.dart';

class JokePage extends StatelessWidget {
  const JokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildBody(context)]),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<JokeCubit>(),
      child: BlocBuilder<JokeCubit, JokeState>(
        builder: (context, state) {
          if (state.jokeStatus == JokeStatus.empty) {
            return const JokeEmptyWidget();
          } else if (state.jokeStatus == JokeStatus.loading) {
            return const CircularProgressIndicator();
          } else if (state.jokeStatus == JokeStatus.loaded) {
            return JokeLoadedWidget(jokeValue: state.joke!.value);
          } else {
            return JokeErrorWidget(errorMsg: state.errorMsg ?? "Erreur");
          }
        },
      ),
    );
  }
}
