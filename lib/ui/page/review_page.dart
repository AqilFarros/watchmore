part of 'page.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.name,required this.reviews});

  final String name;
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
                reviewPageAppbar(name,context),
                const SizedBox(
                  height: 20,
                ),
              ] +
              reviews
                  .map((e) => ReviewCard(
                        review: e,
                      ))
                  .toList(),
        ),
      ),
    );
  }
}

Widget reviewPageAppbar(String name,context) {
  return Container(
    margin: const EdgeInsets.only(top: 60, left: 18, right: 18),
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            MdiIcons.arrowLeftThin,
            color: whiteColor,
            size: 35,
          ),
        ),
        Text(
          name,
          style: heading1,
        ),
      ],
    ),
  );
}
