import 'package:movie_app/constants/base_movie_exports.dart';
import 'package:movie_app/constants/movie_exports.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      DefaultStrings.loadingGif,
      height: 200,
      width: 200,
      animate: true,
      repeat: true,
    );
  }
}
