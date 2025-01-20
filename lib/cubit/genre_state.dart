part of 'genre_cubit.dart';

sealed class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

final class GenreInitial extends GenreState {
  @override
  List<Object> get props => [];
}

final class GenreLoaded extends GenreState {
  final List<Genre> genre;

  const GenreLoaded(this.genre);

  @override
  List<Object> get props => [genre];
}

final class GenreLoadingFailed extends GenreState {
  final String message;

  const GenreLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
