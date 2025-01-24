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

  static Future<ApiReturnValue<User>> login(
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

        User user = User.fromJson(data, username);
        User.sessionId = data["session_id"];

        return ApiReturnValue(value: user);
      }
    }
  }

  // static Future<ApiReturnValue<bool>> logOut({}) async {}
}
