part of 'recommendation_movie_cubit.dart';

sealed class RecommendationMovieState extends Equatable {
  const RecommendationMovieState();

  @override
  List<Object> get props => [];
}

final class RecommendationMovieInitial extends RecommendationMovieState {
  @override
  List<Object> get props => [];
}

final class RecommendationMovieLoaded extends RecommendationMovieState {
  final List<RecommendationMovie> movie;

  const RecommendationMovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

final class RecommendationMovieLoadingFailed extends RecommendationMovieState {
  final String message;

  const RecommendationMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
