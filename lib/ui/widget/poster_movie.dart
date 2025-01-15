part of 'widget.dart';

class PosterMovie extends StatelessWidget {
  const PosterMovie({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image:
                    NetworkImage("https://image.tmdb.org/t/p/original/$image"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            name,
            style: description.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
