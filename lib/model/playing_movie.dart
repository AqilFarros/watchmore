part of 'model.dart';

class PlayingMovie extends Equatable {
  final int? id;
  final String? title;
  final String? overview;
  final String? image;
  final String? poster;
  final String? release;
  final double? rating;
  final List<String>? genre;

  const PlayingMovie({
    this.id,
    this.title,
    this.overview,
    this.image,
    this.poster,
    this.release,
    this.rating,
    this.genre,
  });

  factory PlayingMovie.fromJson(Map<String, dynamic> data) => PlayingMovie(
        id: data["id"],
        title: data["title"],
        overview: data["overview"],
        image: data["backdrop_path"],
        poster: data["poster_path"],
        release: data["release_date"],
        rating: data["vote_average"],
        genre: List<String>.from(data["genre_ids"].map((x) => x.toString())),
      );

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        image,
        poster,
        release,
        rating,
        genre,
      ];
}
