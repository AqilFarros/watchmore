part of 'service.dart';

class CastService {
  static Future<ApiReturnValue<List<Cast>>> getCast(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/credits?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Fetch The Cast");
    } else {
      var data = jsonDecode(response.body);

      List<Cast> cast =
          (data["cast"] as Iterable).map((e) => Cast.fromJson(e)).toList();

      return ApiReturnValue(value: cast);
    }
  }
}
