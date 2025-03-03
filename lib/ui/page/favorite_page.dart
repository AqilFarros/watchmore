part of 'page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key, required this.favoriteMovie});

  final List<FavoriteMovie> favoriteMovie;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      widgetChild: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "My Favorite Movie",
                style: heading1.copyWith(
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: favoriteMovie
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingDetailPage(
                                movie: e,
                                genre: (context.read<GenreCubit>().state
                                        as GenreLoaded)
                                    .genre,
                              ),
                            ),
                          );
                        },
                        child: PosterMovie(
                          name: e.title!,
                          image: e.poster!,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
