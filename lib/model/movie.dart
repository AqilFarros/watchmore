part of 'model.dart';

class Movie extends Equatable {
  final int? id;
  final String? title;
  final String? overview;
  final String? image;
  final String? poster;
  final String? release;
  final double? rating;
  final String? language;
  final List? genre;

  const Movie({
    this.id,
    this.title,
    this.overview,
    this.image,
    this.poster,
    this.release,
    this.rating,
    this.genre,
    this.language,
  });

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
        language,
      ];
}
