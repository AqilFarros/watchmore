part of 'service.dart';

class MovieService {
  static Future<ApiReturnValue<List<PopularMovie>>> getPopularMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url =
        "$baseUrl/movie/popular?language=en-US&page=${page ?? 1}&api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

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

  static Future<ApiReturnValue<List<Review>>> getReview(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/reviews?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Review");
    } else {
      var data = jsonDecode(response.body);

      List<Review> review =
          (data['results'] as Iterable).map((e) => Review.fromJson(e)).toList();

      return ApiReturnValue(value: review);
    }
  }

  static Future<ApiReturnValue<List<Video>>> getVideo(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/videos?api_key=$apiKey";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Video");
    } else {
      var data = jsonDecode(response.body);

      List<Video> video =
          (data['results'] as Iterable).map((e) => Video.fromJson(e)).toList();

      return ApiReturnValue(value: video);
    }
  }

  static Future<ApiReturnValue<List<FavoriteMovie>>> getFavoriteMovie(
      {http.Client? client, required String sessionId}) async {
    client ??= http.Client();

    String url =
        "$baseUrl/account/null/favorite/movies?sort_by=created_at.asc&api_key=$apiKey&session_id=$sessionId";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Favorite Movie");
    } else {
      var data = jsonDecode(response.body);

      List<FavoriteMovie> movie = (data['results'] as Iterable).map((e) => FavoriteMovie.fromJson(e)).toList();

      return ApiReturnValue(value: movie);
    }
  }

  static Future<ApiReturnValue<List<Watchlist>>> getWatchlist(
      {http.Client? client, required String sessionId}) async {
    client ??= http.Client();

    String url =
        "$baseUrl/account/null/watchlist/movies?sort_by=created_at.asc&api_key=$apiKey&session_id=$sessionId";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Watchlist Movie");
    } else {
      var data = jsonDecode(response.body);

      List<Watchlist> movie = (data['results'] as Iterable).map((e) => Watchlist.fromJson(e)).toList();

      return ApiReturnValue(value: movie);
    }
  }
}
