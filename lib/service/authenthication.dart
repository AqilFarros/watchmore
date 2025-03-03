part of 'service.dart';

class AuthenthicationService {
  static Future<ApiReturnValue<Token>> getToken({http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/authentication/token/new?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(
          message: "Oops, there is something wrong, please try again later.");
    } else {
      var data = jsonDecode(response.body);

      Token token = Token.fromJson(data);

      return ApiReturnValue(value: token);
    }
  }

  static Future<ApiReturnValue<String>> login(
      String username, String password, Token token,
      {http.Client? client}) async {
    client ??= http.Client();

    String url =
        "$baseUrl/authentication/token/validate_with_login?api_key=$apiKey";

    var response = await client.post(Uri.parse(
        "$url&username=$username&password=$password&request_token=${token.requestToken}"));

    if (response.statusCode != 200) {
      return ApiReturnValue(
          message: "Invalid username or password, please try again.");
    } else {
      String urlSession = "$baseUrl/authentication/session/new?api_key=$apiKey";

      var response = await client.post(
        Uri.parse("$urlSession&request_token=${token.requestToken}"),
      );

      if (response.statusCode != 200) {
        return ApiReturnValue(
            message: "Oops, there is something wrong, please try again later.");
      } else {
        var data = jsonDecode(response.body);

        return ApiReturnValue(value: data['session_id']);
      }
    }
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/authentication/session";

    var response =
        await client.delete(Uri.parse("$url?session_id=${User.sessionId}"));

    if (response.statusCode != 200) {
      return ApiReturnValue(
          message: "Oops, there is something wrong, please try again later.");
    } else {
      User.sessionId = null;

      return ApiReturnValue(value: true);
    }
  }

  static Future<ApiReturnValue<User>> getUser(
      {http.Client? client, required String sessionId}) async {
    client ??= http.Client();

    String url = "$baseUrl/account/null?api_key=$apiKey&session_id=$sessionId";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(
          message: "Oops, there is something wrong, please try again later.");
    } else {
      var data = jsonDecode(response.body);

      User user = User.fromJson(data);
      User.sessionId = sessionId;

      return ApiReturnValue(value: user);
    }
  }

  static Future<ApiReturnValue<User>> getGuest({http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/authentication/guest_session/new?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(
          message: "Oops, there is something wrong, please try again later.");
    } else {
      var data = jsonDecode(response.body);

      User user = const User(id: null, username: "guest");
      User.sessionId = data["guest_session_id"];

      print(User.sessionId);

      return ApiReturnValue(value: user);
    }
  }
}
