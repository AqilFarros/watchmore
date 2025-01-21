part of 'widget.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
      padding: const EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
        border: Border.all(color: greyColor),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: review.image != null
                ? NetworkImage(
                    "https://image.tmdb.org/t/p/original/${review.image}")
                : NetworkImage(
                    "https://ui-avatars.com/api/?background=random&name=${review.author}"),
            radius: 35,
          ),
          Text(review.author!, style: heading1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.star,
                color: mainColor,
                size: 25,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                review.rating.toString(),
                style: description,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ReadMoreText(
            review.content!,
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
}
