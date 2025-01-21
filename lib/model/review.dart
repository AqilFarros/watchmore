part of 'model.dart';

class Review extends Equatable {
  final String? author;
  final String? image;
  final double? rating;
  final String? content;

  const Review({
    this.author,
    this.image,
    this.rating,
    this.content,
  });

  factory Review.fromJson(Map<String, dynamic> data) {
    return Review(
      author: data['author'],
      image: data['author_details']['avatar_path'],
      rating: data['author_details']['rating'],
      content: data['content'],
    );
  }

  @override
  List<Object?> get props => [
    author,
    image,
    rating,
    content,
  ];
}
