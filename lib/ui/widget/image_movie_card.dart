part of 'widget.dart';

class ImageMovieCard extends StatelessWidget {
  const ImageMovieCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blackColor,
        image: DecorationImage(
          image: NetworkImage("https://image.tmdb.org/t/p/original/$image"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
