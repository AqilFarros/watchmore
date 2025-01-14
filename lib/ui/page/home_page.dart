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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget popularMovie() {
      return Column(
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
          BlocBuilder<PopularMovieCubit, PopularMovieState>(
              builder: (_, state) {
            if (state is PopularMovieLoaded) {
              List<PopularMovie> movie = state.popularMovie;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: movie
                      .map((e) => CardMovie(name: e.title!, image: e.image!))
                      .toList(),
                ),
              );
            } else {
              return Container(
                child: Text("NTTTT"),
              );
            }
          }),
        ],
      );
    }

    Widget appbar() {
      return Container(
        margin: const EdgeInsets.only(top: 70),
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
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appbar(),
                  const SizedBox(
                    height: 12,
                  ),
                  popularMovie(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
