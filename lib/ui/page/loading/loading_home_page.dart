part of '../page.dart';

class LoadingHomePage extends StatefulWidget {
  const LoadingHomePage({super.key});

  @override
  State<LoadingHomePage> createState() => _LoadingHomePageState();
}

class _LoadingHomePageState extends State<LoadingHomePage> {
  List<Genre> _genreMap = [];
  List<PopularMovie> _popularMovie = [];
  List<PlayingMovie> _playingMovie = [];
  List<MostRatedMovie> _ratedMovie = [];

  bool isGenreLoaded = false;
  bool isPlayingMovieLoaded = false;
  bool isPopularMovieLoaded = false;
  bool isRatedMovieLoaded = false;

  void _checkCondition() {
    if (isGenreLoaded &&
        isPlayingMovieLoaded &&
        isPopularMovieLoaded &&
        isRatedMovieLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: "LoadingHomePage"),
          builder: (context) => HomePage(
            genre: _genreMap,
            popularMovie: _popularMovie,
            playingMovie: _playingMovie,
            rateMovie: _ratedMovie,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    context.read<PopularMovieCubit>().getPopularMovie();
    context.read<PlayingMovieCubit>().getPlayingMovie();
    context.read<RatedMovieCubit>().getRatedMovie();
    context.read<GenreCubit>().getGenre();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GenreCubit, GenreState>(
          listener: (context, state) {
            if (state is GenreLoaded) {
              setState(() {
                _genreMap = state.genre;
                isGenreLoaded = true;
                _checkCondition();
              });
            }
          },
        ),
        BlocListener<PlayingMovieCubit, PlayingMovieState>(
          listener: (context, state) {
            if (state is PlayingMovieLoaded) {
              setState(() {
                _playingMovie = state.playingMovie;
                isPlayingMovieLoaded = true;
                _checkCondition();
              });
            }
          },
        ),
        BlocListener<PopularMovieCubit, PopularMovieState>(
          listener: (context, state) {
            if (state is PopularMovieLoaded) {
              setState(() {
                _popularMovie = state.popularMovie;
                isPopularMovieLoaded = true;
                _checkCondition();
              });
            }
          },
        ),
        BlocListener<RatedMovieCubit, RatedMovieState>(
          listener: (context, state) {
            if (state is RatedMovieLoaded) {
              setState(() {
                _ratedMovie = state.rateMovie;
                isRatedMovieLoaded = true;
                _checkCondition();
              });
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
