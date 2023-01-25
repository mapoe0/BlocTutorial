part of 'joke_cubit.dart';

enum JokeStatus { empty, loading, loaded, error }

class JokeState extends Equatable {
  const JokeState({required this.jokeStatus, this.joke, this.errorMsg});
  final JokeStatus jokeStatus;
  final Joke? joke;
  final String? errorMsg;

  factory JokeState.empty() {
    return const JokeState(jokeStatus: JokeStatus.empty);
  }

  @override
  List<Object?> get props => [jokeStatus, joke, errorMsg];

  @override
  String toString() =>
      'JokeState(jokeStatus: $jokeStatus, joke: $joke, errorMsg: $errorMsg)';

  JokeState copyWith({
    JokeStatus? jokeStatus,
    Joke? joke,
    String? errorMsg,
  }) {
    return JokeState(
      jokeStatus: jokeStatus ?? this.jokeStatus,
      joke: joke ?? this.joke,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
