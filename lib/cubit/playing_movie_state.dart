part of 'playing_movie_cubit.dart';

sealed class PlayingMovieState extends Equatable {
  const PlayingMovieState();

  @override
  List<Object> get props => [];
}

final class PlayingMovieInitial extends PlayingMovieState {
  @override
  List<Object> get props => [];
}

final class PlayingMovieLoaded extends PlayingMovieState {
  final List<PlayingMovie> playingMovie;

  const PlayingMovieLoaded(this.playingMovie);

  @override
  List<Object> get props => [playingMovie];
}

final class PlayingMovieLoadingFailed extends PlayingMovieState {
  final String message;

  const PlayingMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

