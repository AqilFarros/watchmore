part of 'service.dart';

class MovieService {
  static Future<ApiReturnValue<List<PopularMovie>>> getPopularMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/popular?language=en-US&page=${page ?? 1}";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Popular Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      List<PopularMovie> popularMovie = (data["results"] as Iterable)
          .map((e) => PopularMovie.fromJson(e))
          .toList();

      return ApiReturnValue(
        value: popularMovie,
      );
    }
  }

  static Future<ApiReturnValue<List<PlayingMovie>>> getPlayingMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url =
        "$baseUrl/movie/now_playing?language=en-US&page${page ?? 1}&api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Fetch The Playing Movie");
    } else {
      var data = jsonDecode(response.body);

      List<PlayingMovie> playingMovie = (data["results"] as Iterable)
          .map((e) => PlayingMovie.fromJson(e))
          .toList();

      return ApiReturnValue(value: playingMovie);
    }
  }

  static Future<ApiReturnValue<List<MostRatedMovie>>> getMostRatedMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url =
        "$baseUrl/movie/top_rated?language=en-US&page=${page ?? 1}&api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Fetch The Most Rated Movie");
    } else {
      var data = jsonDecode(response.body);

      List<MostRatedMovie> movie = (data["results"] as Iterable)
          .map((e) => MostRatedMovie.fromJson(e))
          .toList();

      return ApiReturnValue(value: movie);
    }
  }

  static Future<ApiReturnValue<List<RecommendationMovie>>>
      getRecommendationMovie({int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/recommendations?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Recommendation Movie");
    } else {
      var data = jsonDecode(response.body);

      List<RecommendationMovie> movie = (data['results'] as Iterable)
          .map((e) => RecommendationMovie.fromJson(e))
          .toList();

      return ApiReturnValue(value: movie);
    }
  }

  static Future<ApiReturnValue<DetailMovie>> getDetailMovie(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Detail Movie");
    } else {
      var data = jsonDecode(response.body);

      DetailMovie movie = DetailMovie.fromJson(data);

      return ApiReturnValue(value: movie);
    }
  }

  static Future<ApiReturnValue<List<ImageMovie>>> getImageMovie(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/images?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Image Movie");
    } else {
      var data = jsonDecode(response.body);

      List<ImageMovie> image = (data['backdrops'] as Iterable)
          .map((e) => ImageMovie.fromJson(e))
          .toList();

      return ApiReturnValue(value: image);
    }
  }
}
