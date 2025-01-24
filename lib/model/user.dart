part of 'model.dart';

class User extends Equatable {
  final String username;
  static String? sessionId;

  const User({
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json,String username) => User(
    username: username,
  );

  @override
  List<Object?> get props => [
        username,
      ];
}
