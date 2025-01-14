part of 'model.dart';

class PopularMovie extends Equatable {
  final int? id;
  final String? title;
  final String? overview;
  final String? image;
  final String? release;
  final double? rating;
  final List<String>? genre;

  const PopularMovie({
    this.id,
    this.title,
    this.overview,
    this.image,
    this.release,
    this.rating,
    this.genre,
  });

  factory PopularMovie.fromJson(Map<String, dynamic> data) => PopularMovie(
        id: data["id"],
        title: data["title"],
        overview: data["overview"],
        image: data["backdrop_path"],
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
    release,
    rating,
    genre,
  ];
}
