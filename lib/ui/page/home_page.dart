part of "page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PopularMovieCubit>().getPopularMovie();
    context.read<PlayingMovieCubit>().getPlayingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: gradientColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appbar(),
                const SizedBox(
                  height: 12,
                ),
                carousel(),
                const SizedBox(
                  height: 12,
                ),
                popularMovie(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget carousel() {
  return BlocBuilder<PlayingMovieCubit, PlayingMovieState>(
    builder: (context, state) {
      if (state is PlayingMovieLoaded) {
        List<PlayingMovie> movie = state.playingMovie;

        return CarouselSlider.builder(
            itemCount: 5,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    MovieCarousel(
                      name: movie[itemIndex].title!,
                      overview: movie[itemIndex].overview!,
                      image: movie[itemIndex].image!,
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
      } else {
        return Text('NTTTTT');
      }
    },
  );
}

Widget popularMovie() {
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
        BlocBuilder<PopularMovieCubit, PopularMovieState>(builder: (_, state) {
          if (state is PopularMovieLoaded) {
            List<PopularMovie> movie = state.popularMovie;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[] +
                    movie
                        .take(7)
                        .map((e) =>
                            PosterMovie(name: e.title!, image: e.poster!))
                        .toList() +
                    [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: defaultMargin),
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
            );
          } else {
            return Container(
              child: Text("NTTTT"),
            );
          }
        }),
      ],
    ),
  );
}

Widget appbar() {
  return Container(
    margin: const EdgeInsets.only(top: 70, left: 18, right: 18),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          MdiIcons.sortVariant,
          size: 35,
          color: whiteColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'WCM',
          style: wcm,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: mainColor.withOpacity(0.3),
          ),
          child: Icon(
            MdiIcons.bellOutline,
            color: whiteColor,
            size: 25,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: mainColor.withOpacity(0.3),
          ),
          child: Icon(
            MdiIcons.dotsVertical,
            color: whiteColor,
            size: 25,
          ),
        ),
      ],
    ),
  );
}
