part of 'page.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

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
                "My Watchlist",
                style: heading1.copyWith(
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<WacthlistCubit, WacthlistState>(
                builder: (context, state) {
                  if (state is WacthlistLoaded) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children: state.movie
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
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
