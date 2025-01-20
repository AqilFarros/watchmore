part of 'widget.dart';

class RateMovie extends StatelessWidget {
  const RateMovie({
    super.key,
    required this.title,
    required this.number,
    required this.image,
  });

  final String title;
  final int number;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 240,
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blackColor,
                image: DecorationImage(
                  image: NetworkImage("https://image.tmdb.org/t/p/original/$image"),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              right: 0,
              child: Text(
                number.toString(),
                style: GoogleFonts.ubuntuMono(
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 180,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: description.copyWith(fontWeight: FontWeight.w600),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
