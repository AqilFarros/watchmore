part of 'service.dart';

class GenreService {
  static Future<ApiReturnValue<List<Genre>>> getGenre() async {
    String url = "$baseUrl/genre/movie/list?api_key=$apiKey";

    var response = await http.Client().get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed TOo Fetch Genre");
    } else {
      var data = jsonDecode(response.body);

      List<Genre> genre =
          (data["genres"] as Iterable).map((e) => Genre.fromJson(e)).toList();

      return ApiReturnValue(value: genre);
    }
  }
}
