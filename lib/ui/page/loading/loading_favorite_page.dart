part of '../page.dart';

class LoadingFavoritePage extends StatefulWidget {
  const LoadingFavoritePage({super.key});

  @override
  State<LoadingFavoritePage> createState() => _LoadingFavoritePageState();
}

class _LoadingFavoritePageState extends State<LoadingFavoritePage> {
  bool isFavoriteMovieLoaded = false;

  void _checkCondition() {
    if (isFavoriteMovieLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FavoritePage(),
          settings: const RouteSettings(name: "LoadingFavoritePage"),
        ),
      );
    }
  }

  @override
  void initState() {
    context.read<FavoriteMovieCubit>().getFavoriteMovie(User.sessionId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteMovieCubit, FavoriteMovieState>(
      listener: (context, state) {
        if (state is FavoriteMovieLoaded) {
          setState(() {
            isFavoriteMovieLoaded = true;
            _checkCondition();
          });
        }
      },
      child: Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
