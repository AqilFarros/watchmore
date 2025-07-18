part of '../page.dart';

class LoadingWatchlistPage extends StatefulWidget {
  const LoadingWatchlistPage({super.key});

  @override
  State<LoadingWatchlistPage> createState() => _LoadingWatchlistPageState();
}

class _LoadingWatchlistPageState extends State<LoadingWatchlistPage> {
  bool isWatchlistMovieLoaded = false;

  void _checkCondition() {
    if (isWatchlistMovieLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WatchlistPage(),
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
