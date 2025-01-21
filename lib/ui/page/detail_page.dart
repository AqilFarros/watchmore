part of 'page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.movie,
    required this.genre,
    required this.cast,
    required this.recommendationMovie,
    required this.imageMovie,
    required this.detailMovie,
  });

  final Movie movie;
  final List<Genre> genre;
  final List<Cast> cast;
  final List<RecommendationMovie> recommendationMovie;
  final List<ImageMovie> imageMovie;
  final DetailMovie detailMovie;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List genre;

  @override
  void initState() {
    genre =
        widget.genre.where((g) => widget.movie.genre!.contains(g.id)).toList();
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
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [secondaryColor, mainColor, blackColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/original/${widget.movie.image}",
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  opacity: 0.4,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailPageAppbar(context),
                const SizedBox(
                  height: 12,
                ),
                movieSection(widget.movie, genre, widget.detailMovie, context),
                const SizedBox(
                  height: 12,
                ),
                movieInformation(widget.movie),
                const SizedBox(
                  height: 12,
                ),
                cast(widget.cast),
                const SizedBox(
                  height: 12,
                ),
                overview(widget.movie),
                const SizedBox(
                  height: 12,
                ),
                imageMovie(widget.imageMovie),
                const SizedBox(
                  height: 12,
                ),
                recommendationMovie(
                    context, widget.recommendationMovie, widget.genre),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget recommendationMovie(
    context, List<RecommendationMovie> movie, List<Genre> genre) {
  int i = 0;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommendation",
          style:
              heading1.copyWith(fontWeight: FontWeight.w200, color: greyColor),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: movie.take(7).map((e) {
              i++;
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingDetailPage(
                        movie: e,
                        genre: genre,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: RateMovie(
                    title: e.title!,
                    number: i,
                    image: e.image!,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

Widget imageMovie(List<ImageMovie> image) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gallery",
          style:
              heading1.copyWith(fontWeight: FontWeight.w200, color: greyColor),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: image.take(7).map((e) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                child: ImageMovieCard(
                  image: e.image!,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

Widget overview(Movie movie) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: description.copyWith(color: greyColor),
        ),
        const SizedBox(
          height: 12,
        ),
        ReadMoreText(
          movie.overview!,
          trimLines: 3,
          trimMode: TrimMode.Line,
          lessStyle: description.copyWith(color: mainColor),
          moreStyle: description.copyWith(color: mainColor),
          style: description,
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}

Widget cast(List<Cast> cast) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cast',
          style: description.copyWith(color: greyColor),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cast
                .take(10)
                .map(
                  (e) => CastProfile(
                    image: e.image,
                    name: e.name!,
                    character: e.character!,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}

Widget movieInformation(Movie movie) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    decoration: BoxDecoration(
      border: Border.symmetric(horizontal: BorderSide(color: greyColor)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 12,
            ),
            child: Column(
              children: [
                Text(
                  "Release Date",
                  style: description.copyWith(color: greyColor),
                ),
                Text(
                  movie.release.toString(),
                  style: heading1.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: greyColor),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Language",
                  style: description.copyWith(color: greyColor),
                ),
                Text(
                  movie.language.toString(),
                  style: heading1.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 12,
            ),
            child: Column(
              children: [
                Text(
                  "Rating",
                  style: description.copyWith(color: greyColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.star, color: mainColor, size: 25),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      movie.rating.toString(),
                      style: heading1.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget movieSection(Movie movie, List genre, DetailMovie detailMovie, context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 120,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/original/${movie.poster}"),
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title!,
                style: heading1,
              ),
              Wrap(
                children: genre
                    .map(
                      (e) => Text(
                        "${e.name},",
                        style: description.copyWith(
                          fontWeight: FontWeight.w200,
                          color: greyColor,
                        ),
                      ),
                    )
                    .toList(),
              ),
              Text(
                "${detailMovie.runtime.toString()} min",
                style: description.copyWith(color: mainColor),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoadingVideo(movie: movie),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      backgroundColor: mainColor,
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: Text(
                      "Trailer",
                      style: description,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoadingReview(movie: movie),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: greyColor, width: 1),
                      ),
                    ),
                    child: Text(
                      "Reviews",
                      style: description,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget detailPageAppbar(context) {
  return Container(
    margin: const EdgeInsets.only(top: 60, left: 18, right: 18),
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            MdiIcons.arrowLeftThin,
            color: whiteColor,
            size: 35,
          ),
        ),
        Text(
          "Movie",
          style: heading1,
        ),
      ],
    ),
  );
}
