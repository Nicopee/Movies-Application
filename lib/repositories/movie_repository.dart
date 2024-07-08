import 'package:movie_app/constants/movie_exports.dart';

class MovieRepository {
  static Future<List<Movie>> getPopularMovies() async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Constants.baseUrl,
      method: 'GET',
      connectTimeout: Constants.timeOut,
      responseType: ResponseType.json,
    );
    Dio dio = Dio(baseOptions);

    try {
      final response = await dio.request(popularMovies,
          queryParameters: {'api_key': Constants.apiKey});

      List<Movie> movies = [];
      for (Map<String, dynamic> movie in response.data['results']) {
        movies.add(Movie.fromJson(movie));
      }

      return movies;
    } catch (__) {
      rethrow;
    }
  }

  static Future<List<Movie>> getTrendingMovies() async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Constants.baseUrl,
      method: 'GET',
      connectTimeout: Constants.timeOut,
      responseType: ResponseType.json,
    );
    Dio dio = Dio(baseOptions);

    try {
      final response = await dio.request(trendingMovies,
          queryParameters: {'api_key': Constants.apiKey});

      List<Movie> movies = [];
      for (Map<String, dynamic> movie in response.data['results']) {
        movies.add(Movie.fromJson(movie));
      }

      return movies;
    } catch (__) {
      rethrow;
    }
  }
}
