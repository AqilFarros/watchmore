part of '../page.dart';

class LoadingWatchlistPage extends StatefulWidget {
  const LoadingWatchlistPage({super.key});

  @override
  State<LoadingWatchlistPage> createState() => _LoadingWatchlistPageState();
}

class _LoadingWatchlistPageState extends State<LoadingWatchlistPage> {
  List<Watchlist> _watchlistMovie = [];
  bool isWatchlistMovieLoaded = false;

  void _checkCondition() {
    if (isWatchlistMovieLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WatchlistPage(watchlist: _watchlistMovie),
          settings: const RouteSettings(name: "LoadingWatchlistPage"),
        ),  
      );
    }
  }

  @override
  void initState() {
    context.read<WacthlistCubit>().getWatchlist(User.sessionId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WacthlistCubit, WacthlistState>(
      listener: (context, state) {
        if (state is WacthlistLoaded) {
          setState(() {
            _watchlistMovie = state.movie;
            isWatchlistMovieLoaded = true;
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
