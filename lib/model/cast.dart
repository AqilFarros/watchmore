part of 'model.dart';

class Cast extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? character;

  const Cast({
    this.id,
    this.name,
    this.image,
    this.character,
  });

  factory Cast.fromJson(Map<String, dynamic> data) => Cast(
        id: data['id'],
        name: data['name'],
        image: data['profile_path'],
        character: data['character'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        character,
      ];
}
