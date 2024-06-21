import 'package:movie_app/constants/base_movie_exports.dart';
import 'package:movie_app/constants/movie_exports.dart';

class MovieController extends ChangeNotifier {
  bool loading = false;
  dynamic exception;
  List<Movie> movies = [];

  void fetchPopularMovies() async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }
    try {
      movies = [];
      List<Movie> results = await MovieRepository.getPopularMovies();
      movies.addAll(results);
    } catch (e) {
      exception = e;
    }

    loading = false;
    notifyListeners();
  }
}
