import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tuto_app/core/usecases/usecase.dart';

import 'package:tuto_app/features/joke/domain/entities/joke.dart';
import 'package:tuto_app/features/joke/domain/usecases/joke_usecase.dart';

part 'joke_state.dart';

class JokeCubit extends Cubit<JokeState> {
  JokeUsecase jokeUsecase;

  JokeCubit({required this.jokeUsecase}) : super(JokeState.empty());

  void requestJoke() async {
    emit(state.copyWith(jokeStatus: JokeStatus.loading));

    final useCaseResponse = await jokeUsecase(NoParams());

    useCaseResponse.fold(
        (failure) => emit(state.copyWith(
            jokeStatus: JokeStatus.error, errorMsg: "Erreur de chargement")),
        (joke) =>
            emit(state.copyWith(jokeStatus: JokeStatus.loaded, joke: joke)));
  }
}
