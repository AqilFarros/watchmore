part of 'model.dart';

class User extends Equatable {
  final int? id;
  final String? username;
  static String? sessionId;

  const User({
    this.id,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
id: data['id'],
        username: data["username"],
      );

  @override
  List<Object?> get props => [
        username,
      ];
}
