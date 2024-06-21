import 'package:movie_app/constants/base_movie_exports.dart';
import 'package:movie_app/constants/movie_exports.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Ink.image(
          image: NetworkImage('${Constants.baseImageUrl}/${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
