part of 'favorite_movie_cubit.dart';

sealed class FavoriteMovieState extends Equatable {
  const FavoriteMovieState();

  @override
  List<Object> get props => [];
}

final class FavoriteMovieInitial extends FavoriteMovieState {
  const FavoriteMovieInitial();

  @override
  List<Object> get props => [];
}

final class FavoriteMovieLoaded extends FavoriteMovieState {
  final List<FavoriteMovie> movie;

  const FavoriteMovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

final class FavoriteMovieLoadingFailed extends FavoriteMovieState {
  final String message;

  const FavoriteMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
