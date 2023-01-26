import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container/injection_container.dart';
import '../bloc/cubit/joke/joke_cubit.dart';
import '../widgets/joke/joke_empty_widget.dart';
import '../widgets/joke/joke_error_widget.dart';
import '../widgets/joke/joke_loaded_widget.dart';

class JokePage extends StatelessWidget {
  const JokePage({
    Key? key,
    this.category,
  }) : super(key: key);
  final String? category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildHeader(),
            const Spacer(),
            _buildBody(context),
            const Spacer()
          ]),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      category != null ? category! : "Aléatoire",
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<JokeCubit>(),
      child: BlocBuilder<JokeCubit, JokeState>(
        builder: (context, state) {
          state.category = category;
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
