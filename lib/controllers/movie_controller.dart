import 'package:movie_app/constants/base_movie_exports.dart';
import 'package:movie_app/constants/movie_exports.dart';

class MovieController extends ChangeNotifier {
  bool loading = false;
  dynamic exception;
  List<Movie> popularMovies = [];
  List<Movie> trendingMovies = [];
  Movie? movie;

  void fetchPopularMovies() async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }
    try {
      popularMovies = [];
      List<Movie> results = await MovieRepository.getPopularMovies();
      popularMovies.addAll(results);
    } catch (e) {
      exception = e;
    }

    loading = false;
    notifyListeners();
  }

  void fetchTrendingMovies() async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }
    try {
      trendingMovies = [];
      List<Movie> results = await MovieRepository.getTrendingMovies();
      trendingMovies.addAll(results);
    } catch (e) {
      exception = e;
    }

    loading = false;
    notifyListeners();
  }

  void fetchMovieDetails(movieId) async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }
    try {
      movie = await MovieRepository.getMovieDetails(movieId);
    } catch (e) {
      exception = e;
    }

    loading = false;
    notifyListeners();
  }
}
