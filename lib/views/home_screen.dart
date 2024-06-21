import 'package:movie_app/constants/base_movie_exports.dart';
import 'package:movie_app/constants/movie_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieController movieController = MovieController();
  @override
  void initState() {
    movieController.fetchPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: movieController,
        child: Consumer<MovieController>(builder: (_, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              toolbarHeight: 100,
              backgroundColor: Colors.black,
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DefaultStrings.greeting,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: fontSize16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DefaultStrings.appTitle,
                    style: TextStyle(
                        fontSize: fontSize16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(padding20),
                  child: Icon(Icons.search),
                ),
              ],
            ),
            body: Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 290,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(Constants.bckImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(DefaultStrings.learnIt),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      DefaultStrings.popular,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize20,
                          fontWeight: FontWeight.bold),
                    ),
                    model.loading
                        ? const LoadingWidget()
                        : MoviesList(movies: model.movies),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
