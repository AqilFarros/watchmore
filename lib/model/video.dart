part of 'model.dart';

class Video extends Equatable {
  final String? id;
  final String? name;
  final String? key;

  const Video({
    this.id,
    this.name,
    this.key,
  });

  factory Video.fromJson(Map<String, dynamic> data) {
    return Video(
      id: data['id'],
      name: data['name'],
      key: data['key'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        key,
      ];
}
