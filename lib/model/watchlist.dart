part of 'model.dart';

class Watchlist extends Movie {
  const Watchlist({
    super.id,
    super.title,
    super.overview,
    super.poster,
    super.image,
    super.language,
    super.rating,
    super.release,
    super.genre,
  });

  factory Watchlist.fromJson(Map<String, dynamic> data) => Watchlist(
        id: data['id'],
        title: data['title'],
        overview: data['overview'],
        poster: data['poster_path'],
        image: data['backdrop_path'],
        language: data['original_language'],
        rating: data['vote_average'],
        release: data['release_date'],
        genre: data['genre_ids'],
      );

      factory Watchlist.fromMovie(Movie movie) => Watchlist(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        poster: movie.poster,
        image: movie.image,
        language: movie.language,
        rating: movie.rating,
        release: movie.release,
        genre: movie.genre,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        poster,
        image,
        language,
        rating,
        release,
        genre,
      ];
}