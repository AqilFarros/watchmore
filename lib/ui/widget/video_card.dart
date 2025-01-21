part of 'widget.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key, required this.video});
  final Video video;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  Future<void> _launchUrl() async {
    if (!await launchUrl(
        Uri.parse("https://www.youtube.com/watch?v=${widget.video.key}"))) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: widget.video.key!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ),
          ),
          builder: (builder, player) => player),
    );
  }
}

// Widget o() {
//   return Container(
//     margin: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
//     padding: const EdgeInsets.all(defaultMargin),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: secondaryColor,
//       border: Border.all(color: greyColor),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.video.name!,
//           style: heading1,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//               onPressed: _launchUrl,
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 backgroundColor: mainColor,
//                 shape: const RoundedRectangleBorder(),
//               ),
//               child: Text(
//                 "Watch",
//                 style: description,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
