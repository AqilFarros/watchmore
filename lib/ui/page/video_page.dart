part of 'page.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key, required this.name, required this.video});

  final String name;
  final List<Video> video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
                reviewPageAppbar(name, context),
                const SizedBox(
                  height: 20,
                ),
              ] +
              video.map((e) => VideoCard(video: e)).toList(),
        ),
      ),
    );
  }
}

Widget videoPageAppbar(String name, context) {
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
