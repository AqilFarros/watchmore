part of 'rated_movie_cubit.dart';

sealed class RatedMovieState extends Equatable {
  const RatedMovieState();

  @override
  List<Object> get props => [];
}

final class RatedMovieInitial extends RatedMovieState {
  @override
  List<Object> get props => [];
}

final class RatedMovieLoaded extends RatedMovieState {
  final List<MostRatedMovie> rateMovie;

  const RatedMovieLoaded(this.rateMovie);

  @override
  List<Object> get props => [rateMovie];
}

final class RatedMovieLoadingFailed extends RatedMovieState {
  final String message;

  const RatedMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
