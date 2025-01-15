part of 'widget.dart';

class RateMovie extends StatelessWidget {
  const RateMovie({super.key});

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
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7oIPOMlfbaf1mpmNvgctpv_4JIGmr1vqVXw&s"),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              right: 0,
              child: Text(
                '1',
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
          "Sonic Sonic Sonic SOnic",
          style: description.copyWith(fontWeight: FontWeight.w600),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
