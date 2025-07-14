part of "page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Genre> genres =
        (context.read<GenreCubit>().state as GenreLoaded).genre;

    return GeneralPage(
      widgetChild: [
        BlocBuilder<PlayingMovieCubit, PlayingMovieState>(
          builder: (context, state) {
            if (state is PlayingMovieLoaded) {
              return carousel(context, state.playingMovie, genres);
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(
          height: 12,
        ),
        BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is PopularMovieLoaded) {
              return popularMovie(context, state.popularMovie, genres);
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(
          height: 12,
        ),
        BlocBuilder<RatedMovieCubit, RatedMovieState>(
          builder: (context, state) {
            if (state is RatedMovieLoaded) {
              return rateMovie(context, state.rateMovie, genres);
            }
            else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

Widget rateMovie(BuildContext context, List<Movie> movie, List<Genre> genre) {
  int number = -1;
  List listMovie = [];

  for (int i = 0; i < 10; i += 2) {
    listMovie.add(movie.sublist(i, i + 2));
  }

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: 'MOST RATED',
            style: heading1.copyWith(
              fontWeight: FontWeight.w200,
            ),
            children: [
              TextSpan(
                text: ' MOVIES',
                style: heading1,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: listMovie.map((e) {
            number += 2;
            return Container(
              margin: const EdgeInsets.only(right: defaultMargin),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoadingDetailPage(
                            movie: e[0],
                            genre: genre,
                          ),
                        ),
                      );
                    },
                    child: RateMovie(
                      title: e[0].title!,
                      number: number,
                      image: e[0].image!,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoadingDetailPage(
                            movie: e[1],
                            genre: genre,
                          ),
                        ),
                      );
                    },
                    child: RateMovie(
                      title: e[1].title!,
                      number: number + 1,
                      image: e[1].image!,
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
  );
}

Widget popularMovie(
    BuildContext context, List<Movie> movie, List<Genre> genre) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: 'POPULAR',
            style: heading1.copyWith(
              fontWeight: FontWeight.w200,
            ),
            children: [
              TextSpan(
                text: ' MOVIES',
                style: heading1,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[] +
                movie
                    .take(7)
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          context.read<DetailMovieCubit>();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingDetailPage(
                                movie: e,
                                genre: genre,
                              ),
                            ),
                          );
                        },
                        child: PosterMovie(name: e.title!, image: e.poster!),
                      ),
                    )
                    .toList() +
                [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Column(
                      children: [
                        Icon(
                          MdiIcons.arrowRightCircleOutline,
                          size: 60,
                          color: mainColor,
                        ),
                        Text(
                          "See More",
                          style: heading1.copyWith(color: mainColor),
                        ),
                      ],
                    ),
                  )
                ],
          ),
        )
      ],
    ),
  );
}

Widget carousel(context, List<Movie> movie, List<Genre> genre) {
  return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadingDetailPage(
                    movie: movie[itemIndex],
                    genre: genre,
                  ),
                ),
              );
            },
            child: MovieCarousel(
              name: movie[itemIndex].title!,
              overview: movie[itemIndex].overview!,
              image: movie[itemIndex].image!,
            ),
          ),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ));
}
