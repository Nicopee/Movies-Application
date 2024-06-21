import 'package:movie_app/constants/base_movie_exports.dart';
import 'package:movie_app/constants/movie_exports.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(movies.length, (index) {
          final movie = movies[index];
          return MovieCard(movie);
        }),
      ),
    );
  }
}
