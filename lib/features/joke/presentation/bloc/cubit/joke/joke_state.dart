part of 'joke_cubit.dart';

enum JokeStatus { empty, loading, loaded, error }

class JokeState extends Equatable {
  JokeState({
    required this.jokeStatus,
    this.joke,
    this.errorMsg,
    this.category,
  });
  final JokeStatus jokeStatus;
  final Joke? joke;
  final String? errorMsg;
  String? category;
  factory JokeState.empty() {
    return JokeState(jokeStatus: JokeStatus.empty);
  }

  @override
  List<Object?> get props => [jokeStatus, joke, errorMsg, category];

  @override
  String toString() =>
      'JokeState(jokeStatus: $jokeStatus, joke: $joke, errorMsg: $errorMsg, category: $category)';

  JokeState copyWith(
      {JokeStatus? jokeStatus,
      Joke? joke,
      String? errorMsg,
      String? category}) {
    return JokeState(
        jokeStatus: jokeStatus ?? this.jokeStatus,
        joke: joke ?? this.joke,
        errorMsg: errorMsg ?? this.errorMsg,
        category: category ?? this.category);
  }
}
