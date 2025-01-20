part of 'widget.dart';

class CastProfile extends StatelessWidget {
  const CastProfile({
    super.key,
    this.image,
    required this.name,
    required this.character,
  });

  final String? image;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: mainColor,
            backgroundImage: image != null
                ? NetworkImage("https://image.tmdb.org/t/p/original/$image")
                : NetworkImage(
                    "https://ui-avatars.com/api/?background=random&name=$name"),
            radius: 45,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            name,
            style:
                description.copyWith(fontWeight: FontWeight.w600, fontSize: 10),
            textAlign: TextAlign.center,
          ),
          Text(
            character,
            style: description.copyWith(color: mainColor, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
