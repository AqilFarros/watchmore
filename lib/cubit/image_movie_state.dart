part of 'image_movie_cubit.dart';

sealed class ImageMovieState extends Equatable {
  const ImageMovieState();

  @override
  List<Object> get props => [];
}

final class ImageMovieInitial extends ImageMovieState {
  @override
  List<Object> get props => [];
}

final class ImageMovieLoaded extends ImageMovieState {
  final List<ImageMovie> image;

  const ImageMovieLoaded(this.image);

  @override
  List<Object> get props => [image];
}

final class ImageMovieLoadingFailed extends ImageMovieState {
  final String message;

  const ImageMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
