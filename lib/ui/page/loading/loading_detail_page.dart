part of '../page.dart';

class LoadingDetailPage extends StatefulWidget {
  const LoadingDetailPage({
    super.key,
    required this.movie,
    required this.genre,
  });

  final Movie movie;
  final List<Genre> genre;

  @override
  State<LoadingDetailPage> createState() => _LoadingDetailPageState();
}

class _LoadingDetailPageState extends State<LoadingDetailPage> {
  List<FavoriteMovie> favoriteMovie = [];
  List<Watchlist> watchlist = [];
  List<Cast> cast = [];
  List<RecommendationMovie> recommendationMovie = [];
  List<ImageMovie> imageMovie = [];
  DetailMovie detailMovie = const DetailMovie();

  bool isFavoriteMovieLoaded = false;
  bool isWatchlistLoaded = false;
  bool isCastLoaded = false;
  bool isRecommendationMovieLoaded = false;
  bool isImageMovieLoaded = false;
  bool isDetailMovieLoaded = false;

  void _isCheckCondition() {
    if (isCastLoaded &&
        isRecommendationMovieLoaded &&
        isImageMovieLoaded &&
        isDetailMovieLoaded &&
        isFavoriteMovieLoaded &&
        isWatchlistLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            movie: widget.movie,
            favoriteMovie: favoriteMovie,
            watchlist: watchlist,
            genre: widget.genre,
            cast: cast,
            recommendationMovie: recommendationMovie,
            imageMovie: imageMovie,
            detailMovie: detailMovie,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    context.read<FavoriteMovieCubit>().getFavoriteMovie(User.sessionId!);
    context.read<WacthlistCubit>().getWatchlist(User.sessionId!);
    context.read<CastCubit>().getCast(widget.movie.id!);
    context
        .read<RecommendationMovieCubit>()
        .getRecommendationMovie(widget.movie.id!);
    context.read<ImageMovieCubit>().getImageMovie(widget.movie.id!);
    context.read<DetailMovieCubit>().getDetailMovie(widget.movie.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteMovieCubit, FavoriteMovieState>(
          listener: (context, state) {
            if (state is FavoriteMovieLoaded) {
              setState(() {
                favoriteMovie = state.movie;
                isFavoriteMovieLoaded = true;
                _isCheckCondition();
              });
            }
          },
        ),
        BlocListener<WacthlistCubit, WacthlistState>(
          listener: (context, state) {
            if (state is WacthlistLoaded) {
              setState(() {
                watchlist = state.movie;
                isWatchlistLoaded = true;
                _isCheckCondition();
              });
            }
          },
        ),
        BlocListener<CastCubit, CastState>(
          listener: (context, state) {
            if (state is CastLoaded) {
              setState(() {
                cast = state.cast;
                isCastLoaded = true;
                _isCheckCondition();
              });
            }
          },
        ),
        BlocListener<RecommendationMovieCubit, RecommendationMovieState>(
          listener: (context, state) {
            if (state is RecommendationMovieLoaded) {
              setState(() {
                recommendationMovie = state.movie;
                isRecommendationMovieLoaded = true;
                _isCheckCondition();
              });
            }
          },
        ),
        BlocListener<ImageMovieCubit, ImageMovieState>(
            listener: (context, state) {
          if (state is ImageMovieLoaded) {
            setState(() {
              imageMovie = state.image;
              isImageMovieLoaded = true;
              _isCheckCondition();
            });
          }
        }),
        BlocListener<DetailMovieCubit, DetailMovieState>(
            listener: (context, state) {
          if (state is DetailMovieLoaded) {
            setState(() {
              detailMovie = state.detail;
              isDetailMovieLoaded = true;
              _isCheckCondition();
            });
          }
        })
      ],
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
