part of 'popular_movie_cubit.dart';

sealed class PopularMovieState extends Equatable {
  const PopularMovieState();
}

final class PopularMovieInitial extends PopularMovieState {
  @override
  List<Object> get props => [];
}

final class PopularMovieLoaded extends PopularMovieState {
  final List<PopularMovie> popularMovie;

  const PopularMovieLoaded(this.popularMovie);

  @override
  List<Object?> get props => [popularMovie];
}

final class PopularMovieLoadingFailed extends PopularMovieState {
  final String message;

  const PopularMovieLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
