part of 'widget.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 200,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(
                  "https://api.themoviedb.org/3/movie/$image/images?api_key=65bc57d002bbce4b6ce3f6a210eba566"),
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
          softWrap: true,
        )
      ],
    );
  }
}
