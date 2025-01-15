part of 'widget.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({
    super.key,
    required this.name,
    required this.overview,
    required this.image,
  });

  final String name;
  final String overview;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage("https://image.tmdb.org/t/p/original/$image"),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        color: blackColor.withOpacity(0.6),
        child: Text(
          name,
          style: heading1,
        ),
      ),
    );
  }
}
