part of 'model.dart';

class Token {
  String expiresAt;
  String requestToken;

  Token({
    required this.expiresAt,
    required this.requestToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    expiresAt: json["expires_at"],
    requestToken: json["request_token"],
  );
}
